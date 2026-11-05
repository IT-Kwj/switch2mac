#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _257 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_257, float2(0.0), isnan(_257))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_257, float2(0.0), isnan(_257))).x;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = precise::max(_91, _85);
    bool _97 = _93 != 0.0;
    bool _99 = isnan(_93);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    bool _107 = !_105;
    if (!_107)
    {
        float _109 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _111 = fma(_93, _109, 1.0);
        float _113 = log2(_111);
        float _115 = _113 + (-1.0);
        float _117 = exp2(_115);
        float _119 = _117 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _123 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _125 = -_119;
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _129 = -_119;
        float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _133 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _135 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _137 = -_119;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _389 = float2(_121, _123);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_389, float2(0.0), isnan(_389)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_389, float2(0.0), isnan(_389)), level(_115)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float _151 = -_119;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _411 = float2(_127, _131);
        float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_411, float2(0.0), isnan(_411)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_411, float2(0.0), isnan(_411)), level(_115)).xyz;
        float _157 = _155.x;
        float _159 = _155.y;
        float _161 = _155.z;
        float2 _426 = float2(_133, _135);
        float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_426, float2(0.0), isnan(_426)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_426, float2(0.0), isnan(_426)), level(_115)).xyz;
        float _165 = _163.x;
        float _167 = _163.y;
        float _169 = _163.z;
        float2 _441 = float2(_139, _153);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_441, float2(0.0), isnan(_441)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_441, float2(0.0), isnan(_441)), level(_115)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float _179 = 0.0 + _113;
        float _181 = precise::clamp(_179, 0.0, 1.0);
        float _183 = fma(_83, _181, _87);
        float _185 = 1.0 / _183;
        float _187 = _145 + _157;
        float _189 = _147 + _159;
        float _191 = _149 + _161;
        float _193 = _83 * _185;
        float _195 = _187 + _165;
        float _197 = _189 + _167;
        float _199 = _191 + _169;
        float _201 = _195 + _173;
        float _203 = _197 + _175;
        float _205 = _199 + _177;
        float _207 = _181 * _201;
        float _209 = _207 * 0.25;
        float _211 = _181 * _203;
        float _213 = _211 * 0.25;
        float _215 = _181 * _205;
        float _217 = _215 * 0.25;
        float _219 = _209 * _193;
        float _221 = _213 * _193;
        float _223 = _217 * _193;
        out.m_36.x = _219;
        out.m_36.y = _221;
        out.m_36.z = _223;
        out.m_36.w = _183;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _87;
    return out;
}


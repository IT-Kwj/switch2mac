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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _249 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_249, float2(0.0), isnan(_249))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_69)
    {
        discard_fragment();
    }
    float2 _269 = float2(_61, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_269, float2(0.0), isnan(_269))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_269, float2(0.0), isnan(_269))).x;
    float _73 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    if (_69)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _77 = in.m_38.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_38.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_38.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = precise::max(_71, _75);
    float _97 = _59 * _81;
    float _99 = _59 * _93;
    float _101 = precise::max(_95, _97);
    float _103 = _59 * _87;
    bool _105 = _101 != 0.0;
    bool _107 = isnan(_101);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    bool _115 = !_113;
    if (!_115)
    {
        float _117 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _119 = fma(_101, _117, 1.0);
        float _121 = log2(_119);
        float _123 = _121 + (-1.0);
        float _125 = exp2(_123);
        float _127 = _125 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _129 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _131 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _133 = -_127;
        float _135 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _137 = -_127;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _141 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _143 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _145 = -_127;
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float2 _407 = float2(_129, _131);
        float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_407, float2(0.0), isnan(_407)), level(_123)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_407, float2(0.0), isnan(_407)), level(_123)).xyz;
        float _153 = _151.x;
        float _155 = _151.y;
        float _157 = _151.z;
        float _159 = -_127;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _429 = float2(_135, _139);
        float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_429, float2(0.0), isnan(_429)), level(_123)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_429, float2(0.0), isnan(_429)), level(_123)).xyz;
        float _165 = _163.x;
        float _167 = _163.y;
        float _169 = _163.z;
        float2 _444 = float2(_141, _143);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_444, float2(0.0), isnan(_444)), level(_123)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_444, float2(0.0), isnan(_444)), level(_123)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float2 _459 = float2(_147, _161);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_459, float2(0.0), isnan(_459)), level(_123)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_459, float2(0.0), isnan(_459)), level(_123)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float _187 = 0.0 + _121;
        float _189 = precise::clamp(_187, 0.0, 1.0);
        float _191 = fma(_99, _189, _103);
        float _193 = _153 + _165;
        float _195 = _155 + _167;
        float _197 = _157 + _169;
        float _199 = _193 + _173;
        float _201 = _195 + _175;
        float _203 = _197 + _177;
        float _205 = _199 + _181;
        float _207 = _201 + _183;
        float _209 = _203 + _185;
        float _211 = _205 * 0.25;
        float _213 = _207 * 0.25;
        float _215 = _209 * 0.25;
        out.m_36.x = _211;
        out.m_36.y = _213;
        out.m_36.z = _215;
        out.m_36.w = _191;
        return out;
    }
    discard_fragment();
    return out;
}


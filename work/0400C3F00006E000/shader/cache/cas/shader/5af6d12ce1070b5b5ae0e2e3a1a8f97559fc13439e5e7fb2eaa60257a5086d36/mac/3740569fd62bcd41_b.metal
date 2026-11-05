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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _259 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_259, float2(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_259, float2(0.0), isnan(_259))).x;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_33.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_35.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _59 * _71;
    float _93 = _59 * _77;
    float _95 = _59 * _83;
    float _97 = _59 * _89;
    float _99 = fma(_65, _91, _93);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    bool _105 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _107 = fma(_65, _95, _97);
    float _109 = precise::clamp(_107, 0.0, 1.0);
    bool _111 = !_105;
    float _113 = _111 ? _101 : 0.0;
    float _115 = precise::max(_113, _109);
    bool _117 = _115 != 0.0;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan(0.0);
    bool _125 = _121 || _123;
    bool _127 = !_125;
    if (!_127)
    {
        float _129 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _131 = fma(_115, _129, 1.0);
        float _133 = log2(_131);
        float _135 = _133 + (-1.0);
        float _137 = exp2(_135);
        float _139 = _137 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _143 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _145 = -_139;
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _149 = -_139;
        float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _153 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _155 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _157 = -_139;
        float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _161 = -_139;
        float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _419 = float2(_141, _143);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_419, float2(0.0), isnan(_419)), level(_135)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_419, float2(0.0), isnan(_419)), level(_135)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float2 _434 = float2(_147, _151);
        float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_434, float2(0.0), isnan(_434)), level(_135)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_434, float2(0.0), isnan(_434)), level(_135)).xyz;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _175.z;
        float2 _449 = float2(_153, _155);
        float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_449, float2(0.0), isnan(_449)), level(_135)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_449, float2(0.0), isnan(_449)), level(_135)).xyz;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float2 _464 = float2(_159, _163);
        float3 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_464, float2(0.0), isnan(_464)), level(_135)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_464, float2(0.0), isnan(_464)), level(_135)).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        float _199 = 0.0 + _133;
        float _201 = precise::clamp(_199, 0.0, 1.0);
        float _203 = _169 + _177;
        float _205 = _171 + _179;
        float _207 = _173 + _181;
        float _209 = _203 + _185;
        float _211 = _205 + _187;
        float _213 = _207 + _189;
        float _215 = _209 + _193;
        float _217 = _211 + _195;
        float _219 = _213 + _197;
        float _221 = _215 * 0.25;
        float _223 = _217 * 0.25;
        float _225 = _219 * 0.25;
        out.m_38.x = _221;
        out.m_38.y = _223;
        out.m_38.z = _225;
        out.m_38.w = _201;
        return out;
    }
    discard_fragment();
    return out;
}


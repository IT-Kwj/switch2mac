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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
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
    float2 _303 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_303, float2(0.0), isnan(_303))).x;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_67)
    {
        discard_fragment();
    }
    if (_67)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _69 = in.m_36.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_36.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = _57 * _73;
    float _93 = precise::max(_89, _91);
    float _95 = _57 * _79;
    float _97 = _57 * _85;
    bool _99 = _93 != 0.0;
    bool _101 = isnan(_93);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    float _109 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = precise::min(_111, _115);
    bool _119 = !_107;
    if (!_119)
    {
        float _121 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _123 = fma(_93, _121, 1.0);
        float _125 = log2(_123);
        float _127 = _125 + (-1.0);
        float _129 = exp2(_127);
        float _131 = _129 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _135 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _137 = -_131;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _141 = -_131;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _147 = -_131;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _151 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _153 = -_131;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _476 = float2(_133, _135);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_476, float2(0.0), isnan(_476)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_476, float2(0.0), isnan(_476)), level(_127)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float2 _491 = float2(_139, _143);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_491, float2(0.0), isnan(_491)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_491, float2(0.0), isnan(_491)), level(_127)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float2 _506 = float2(_145, _151);
        float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_506, float2(0.0), isnan(_506)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_506, float2(0.0), isnan(_506)), level(_127)).xyz;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _175.z;
        float2 _521 = float2(_149, _155);
        float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_521, float2(0.0), isnan(_521)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_521, float2(0.0), isnan(_521)), level(_127)).xyz;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = _161 + _169;
        float _193 = _163 + _171;
        float _195 = _165 + _173;
        float _197 = _191 + _177;
        float _199 = _193 + _179;
        float _201 = _195 + _181;
        float _203 = _197 + _185;
        float _205 = _199 + _187;
        float _207 = _201 + _189;
        float _209 = _203 * 0.25;
        float _211 = 0.0 + _125;
        float _213 = precise::clamp(_211, 0.0, 1.0);
        float _215 = _205 * 0.25;
        float _217 = _207 * 0.25;
        float _219 = -_209;
        float _221 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[13].x, _219);
        float _223 = fma(_97, _213, _95);
        float _225 = -_215;
        float _227 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[13].y, _225);
        float _229 = -_217;
        float _231 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[13].z, _229);
        float _233 = fma(_117, _221, _209);
        float _235 = 1.0 / _223;
        float _237 = fma(_117, _227, _215);
        float _239 = fma(_117, _231, _217);
        float _241 = _213 * _233;
        float _243 = _213 * _237;
        float _245 = _213 * _239;
        float _247 = -_241;
        float _249 = _247 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _251 = -_243;
        float _253 = _251 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _255 = -_245;
        float _257 = _255 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _259 = fma(_95, _249, _241);
        float _261 = fma(_95, _253, _243);
        float _263 = fma(_95, _257, _245);
        float _265 = _259 * _235;
        float _267 = _261 * _235;
        float _269 = _263 * _235;
        out.m_34.x = _265;
        out.m_34.y = _267;
        out.m_34.z = _269;
        out.m_34.w = _223;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _95;
    return out;
}


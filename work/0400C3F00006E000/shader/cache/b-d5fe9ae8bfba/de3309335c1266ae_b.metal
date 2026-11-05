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
    float2 _289 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_289, float2(0.0), isnan(_289))).x;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = precise::max(_91, _95);
    float _99 = precise::max(_97, _87);
    bool _103 = _99 != 0.0;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.0);
    bool _111 = _107 || _109;
    float _113 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = precise::min(_115, _119);
    bool _123 = !_111;
    if (!_123)
    {
        float _125 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _127 = fma(_99, _125, 1.0);
        float _129 = log2(_127);
        float _131 = _129 + (-1.0);
        float _133 = exp2(_131);
        float _135 = _133 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _139 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _141 = -_135;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _145 = -_135;
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _149 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _151 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _153 = -_135;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _451 = float2(_137, _139);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_451, float2(0.0), isnan(_451)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_451, float2(0.0), isnan(_451)), level(_131)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float _167 = -_135;
        float _169 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _473 = float2(_143, _147);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_473, float2(0.0), isnan(_473)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_473, float2(0.0), isnan(_473)), level(_131)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float2 _488 = float2(_149, _151);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_488, float2(0.0), isnan(_488)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_488, float2(0.0), isnan(_488)), level(_131)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float2 _503 = float2(_155, _169);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_503, float2(0.0), isnan(_503)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_503, float2(0.0), isnan(_503)), level(_131)).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        float _195 = 0.0 + _129;
        float _197 = precise::clamp(_195, 0.0, 1.0);
        float _199 = _197 * _85;
        float _201 = fma(_85, _197, _83);
        float _203 = _165 + _177;
        float _205 = _161 + _173;
        float _207 = _163 + _175;
        float _209 = _203 + _185;
        float _211 = _205 + _181;
        float _213 = 1.0 / _201;
        float _215 = _207 + _183;
        float _217 = _209 + _193;
        float _219 = _211 + _189;
        float _221 = _215 + _191;
        float _223 = _217 * 0.25;
        float _225 = _219 * 0.25;
        float _227 = _221 * 0.25;
        float _229 = -_223;
        float _231 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[13].z, _229);
        float _233 = -_225;
        float _235 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[13].x, _233);
        float _237 = -_227;
        float _239 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[13].y, _237);
        float _241 = fma(_121, _231, _223);
        float _243 = fma(_121, _235, _225);
        float _245 = _213 * _199;
        float _247 = fma(_121, _239, _227);
        float _249 = _241 * _199;
        float _251 = _243 * _245;
        float _253 = _247 * _245;
        float _255 = _249 * _213;
        out.m_36.x = _251;
        out.m_36.y = _253;
        out.m_36.z = _255;
        out.m_36.w = _201;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _83;
    return out;
}


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
    float2 _301 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).x;
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
    float _89 = -_63;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _93 = 1.0 / _91;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = precise::max(_97, _87);
    float _101 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    bool _107 = _99 != 0.0;
    bool _109 = isnan(_99);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    float _117 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = precise::min(_119, _103);
    bool _123 = !_115;
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
        float2 _463 = float2(_137, _139);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_463, float2(0.0), isnan(_463)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_463, float2(0.0), isnan(_463)), level(_131)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float _167 = -_135;
        float _169 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _485 = float2(_143, _147);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_485, float2(0.0), isnan(_485)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_485, float2(0.0), isnan(_485)), level(_131)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float2 _500 = float2(_149, _151);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_500, float2(0.0), isnan(_500)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_500, float2(0.0), isnan(_500)), level(_131)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float2 _515 = float2(_155, _169);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_515, float2(0.0), isnan(_515)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_515, float2(0.0), isnan(_515)), level(_131)).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        float _195 = 0.0 + _129;
        float _197 = precise::clamp(_195, 0.0, 1.0);
        float _199 = fma(_85, _197, _83);
        float _201 = _121 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _203 = _163 + _175;
        float _205 = _161 + _173;
        float _207 = _165 + _177;
        float _209 = _203 + _183;
        float _211 = _205 + _181;
        float _213 = _207 + _185;
        float _215 = _209 + _191;
        float _217 = _211 + _189;
        float _219 = _213 + _193;
        float _221 = _215 * 0.14665000140666961669921875;
        float _223 = _215 * 0.25;
        float _225 = _219 * 0.25;
        float _227 = fma(_217, 0.0747250020503997802734375, _221);
        float _229 = _217 * 0.25;
        float _231 = fma(_219, 0.028599999845027923583984375, _227);
        float _233 = -_229;
        float _235 = _233 + _231;
        float _237 = -_223;
        float _239 = _237 + _231;
        float _241 = -_225;
        float _243 = _241 + _231;
        float _245 = fma(_201, _235, _229);
        float _247 = fma(_201, _239, _223);
        float _249 = fma(_201, _243, _225);
        float _251 = -_245;
        float _253 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[13].x, _251);
        float _255 = -_247;
        float _257 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[13].y, _255);
        float _259 = -_249;
        float _261 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[13].z, _259);
        float _263 = fma(_121, _253, _245);
        float _265 = fma(_121, _257, _247);
        float _267 = fma(_121, _261, _249);
        out.m_36.x = _263;
        out.m_36.y = _265;
        out.m_36.z = _267;
        out.m_36.w = _199;
        return out;
    }
    discard_fragment();
    return out;
}


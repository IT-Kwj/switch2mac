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
    float2 _341 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_75)
    {
        discard_fragment();
    }
    float2 _373 = float2(_61, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_373, float2(0.0), isnan(_373))).x;
    if (_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _79 = in.m_38.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_38.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_38.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = precise::max(_77, _99);
    float _107 = _59 * _83;
    float _109 = precise::max(_105, _107);
    bool _111 = _109 != 0.0;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.0);
    bool _119 = _115 || _117;
    float _121 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _59 * _89;
    float _127 = _59 * _95;
    float _129 = precise::min(_103, _123);
    bool _131 = !_119;
    if (!_131)
    {
        float _133 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _135 = fma(_109, _133, 1.0);
        float _137 = log2(_135);
        float _139 = _137 + (-1.0);
        float _141 = exp2(_139);
        float _143 = _141 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _149 = -_143;
        float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _153 = -_143;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _157 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _159 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _161 = -_143;
        float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _165 = -_143;
        float _167 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float2 _536 = float2(_145, _147);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_536, float2(0.0), isnan(_536)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_536, float2(0.0), isnan(_536)), level(_139)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float2 _551 = float2(_151, _155);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_551, float2(0.0), isnan(_551)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_551, float2(0.0), isnan(_551)), level(_139)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float2 _566 = float2(_157, _159);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_566, float2(0.0), isnan(_566)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_566, float2(0.0), isnan(_566)), level(_139)).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        float2 _581 = float2(_167, _163);
        float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_581, float2(0.0), isnan(_581)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_581, float2(0.0), isnan(_581)), level(_139)).xyz;
        float _197 = _195.x;
        float _199 = _195.y;
        float _201 = _195.z;
        float _203 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _205 = _175 + _183;
        float _207 = _173 + _181;
        float _209 = _177 + _185;
        float _211 = _205 + _191;
        float _213 = _207 + _189;
        float _215 = _209 + _193;
        float _217 = _211 + _199;
        float _219 = _213 + _197;
        float _221 = _215 + _201;
        float _223 = _217 * 0.14665000140666961669921875;
        float _225 = _217 * 0.25;
        float _227 = fma(_219, 0.0747250020503997802734375, _223);
        float _229 = _219 * 0.25;
        float _231 = fma(_221, 0.028599999845027923583984375, _227);
        float _233 = _221 * 0.25;
        float _235 = -_229;
        float _237 = _235 + _231;
        float _239 = -_225;
        float _241 = _239 + _231;
        float _243 = -_233;
        float _245 = _243 + _231;
        float _247 = fma(_203, _237, _229);
        float _249 = 0.0 + _137;
        float _251 = precise::clamp(_249, 0.0, 1.0);
        float _253 = fma(_203, _241, _225);
        float _255 = fma(_203, _245, _233);
        float _257 = -_247;
        float _259 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[13].x, _257);
        float _261 = fma(_127, _251, _125);
        float _263 = -_253;
        float _265 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[13].y, _263);
        float _267 = -_255;
        float _269 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[13].z, _267);
        float _271 = fma(_129, _259, _247);
        float _273 = 1.0 / _261;
        float _275 = fma(_129, _265, _253);
        float _277 = fma(_129, _269, _255);
        float _279 = _251 * _271;
        float _281 = _251 * _275;
        float _283 = _251 * _277;
        float _285 = -_279;
        float _287 = _285 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _289 = -_281;
        float _291 = _289 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _293 = -_283;
        float _295 = _293 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _297 = fma(_125, _287, _279);
        float _299 = fma(_125, _291, _281);
        float _301 = fma(_125, _295, _283);
        float _303 = _297 * _273;
        float _305 = _299 * _273;
        float _307 = _301 * _273;
        out.m_36.x = _303;
        out.m_36.y = _305;
        out.m_36.z = _307;
        out.m_36.w = _261;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _125;
    return out;
}


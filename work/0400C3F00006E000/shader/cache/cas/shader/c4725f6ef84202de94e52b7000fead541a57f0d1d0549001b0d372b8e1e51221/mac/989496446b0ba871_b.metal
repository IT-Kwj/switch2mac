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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _417 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_417, float2(0.0), isnan(_417))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _89 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _91 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _93 = -_75;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _97 = -_75;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _101 = fma(_89, -0.5, 0.5);
    float _103 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _105 = -_75;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _109 = fma(_95, -0.5, 0.5);
    float _111 = fma(_91, -0.5, 0.5);
    float _113 = fma(_99, -0.5, 0.5);
    float2 _513 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_513, float2(0.0), isnan(_513))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_513, float2(0.0), isnan(_513))).x;
    float _117 = fma(_103, -0.5, 0.5);
    float _119 = fma(_107, -0.5, 0.5);
    float2 _526 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_526, float2(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_526, float2(0.0), isnan(_526))).x;
    float2 _536 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_536, float2(0.0), isnan(_536))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_536, float2(0.0), isnan(_536))).x;
    float2 _545 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_545, float2(0.0), isnan(_545))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_545, float2(0.0), isnan(_545))).x;
    float2 _555 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float2 _564 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_564, float2(0.0), isnan(_564))).x;
    float _131 = 0.0 + _101;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = 0.0 + _109;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = abs(_75);
    float _141 = -_139;
    float _143 = _141 + 1.0;
    float _145 = _133 + _111;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _137 + _113;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = _117 + _147;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _119 + _151;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _165 = abs(_115);
    float _167 = log2(_165);
    float _169 = abs(_121);
    float _171 = log2(_169);
    float _173 = abs(_123);
    float _175 = log2(_173);
    float _177 = _167 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _179 = abs(_125);
    float _181 = log2(_179);
    float _183 = _171 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _189 = exp2(_177);
    float _191 = _175 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _197 = exp2(_183);
    float _199 = _181 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _201 = abs(_127);
    float _203 = log2(_201);
    float _205 = _143 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_189, _187, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = exp2(_191);
    float _215 = fma(_187, _197, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = fma(_163, _197, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = abs(_129);
    float _225 = log2(_223);
    float _227 = fma(_189, _195, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _203 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _233 = fma(_189, _163, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _241 = exp2(_199);
    float _243 = fma(_195, _197, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _249 = _247 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _251 = fma(_213, _249, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _253 = abs(_207);
    float _255 = log2(_253);
    float _257 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _259 = _257 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _261 = fma(_213, _239, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _263 = _211 + _251;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = fma(_213, _259, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _269 = _229 + _261;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = exp2(_231);
    float _275 = _235 + _267;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _225 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _281 = fma(_249, _241, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _283 = fma(_239, _241, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _285 = _217 + _281;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = exp2(_279);
    float _291 = _255 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _301 = fma(_259, _241, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _303 = _245 + _283;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _309 = _307 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _311 = exp2(_291);
    float _313 = fma(_273, _295, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _315 = fma(_273, _299, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _317 = _221 + _301;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = fma(_273, _309, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _323 = _313 + _265;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = _315 + _271;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = fma(_295, _289, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _333 = fma(_299, _289, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _335 = fma(_309, _289, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _337 = _321 + _277;
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = _331 + _287;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _333 + _305;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = _335 + _319;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].w, _155);
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].w, _159);
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].x, _325);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].y, _329);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].z, _339);
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].x, _343);
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].y, _347);
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].z, _351);
    float _383 = precise::clamp(_381, 0.0, 1.0);
    out.m_38.x = _363;
    out.m_38.y = _367;
    out.m_38.z = _371;
    out.m_38.w = _355;
    out.m_40.x = _375;
    out.m_40.y = _379;
    out.m_40.z = _383;
    out.m_40.w = _359;
    return out;
}


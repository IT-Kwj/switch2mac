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
    float2 _359 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_359, float2(0.0), isnan(_359))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _95 = -_75;
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _101 = -_75;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _105 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _107 = -_75;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _111 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _113 = -_75;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _117 = fma(_93, -0.5, 0.5);
    float _119 = fma(_97, -0.5, 0.5);
    float _121 = fma(_99, -0.5, 0.5);
    float _123 = fma(_103, -0.5, 0.5);
    float _125 = fma(_105, -0.5, 0.5);
    float _127 = fma(_109, -0.5, 0.5);
    float _129 = fma(_111, -0.5, 0.5);
    float _131 = fma(_115, -0.5, 0.5);
    float2 _485 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_485, float2(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_485, float2(0.0), isnan(_485))).x;
    float2 _494 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float2 _504 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_504, float2(0.0), isnan(_504))).x;
    float2 _513 = float2(_123, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_513, float2(0.0), isnan(_513))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_513, float2(0.0), isnan(_513))).x;
    float2 _523 = float2(_125, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).x;
    float2 _532 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).x;
    float2 _542 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_542, float2(0.0), isnan(_542))).x;
    float2 _551 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_551, float2(0.0), isnan(_551))).x;
    float _149 = _117 + _121;
    float _151 = _119 + _123;
    float _153 = abs(_75);
    float _155 = -_153;
    float _157 = _155 + 1.0;
    float _159 = _149 + _125;
    float _161 = _151 + _127;
    float _163 = _129 + _159;
    float _165 = _157 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _173 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _175 = _173 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _177 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _179 = _177 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _193 = abs(_167);
    float _195 = log2(_193);
    float _197 = _131 + _161;
    float _199 = fma(_133, _171, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _201 = fma(_133, _175, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _203 = fma(_133, _179, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _205 = fma(_171, _135, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _207 = fma(_175, _135, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _209 = fma(_179, _135, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _211 = fma(_137, _183, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _213 = fma(_137, _187, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _215 = fma(_137, _191, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _217 = fma(_191, _139, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _219 = _199 + _211;
    float _221 = _201 + _213;
    float _223 = fma(_183, _139, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _225 = fma(_187, _139, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _227 = _203 + _215;
    float _229 = _205 + _223;
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _235 = _207 + _225;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _241 = _209 + _217;
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _247 = fma(_141, _233, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _249 = fma(_141, _239, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _251 = fma(_233, _143, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _253 = fma(_141, _245, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _255 = _195 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _257 = _221 + _249;
    float _259 = _219 + _247;
    float _261 = _227 + _253;
    float _263 = fma(_239, _143, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _265 = fma(_245, _143, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _267 = _229 + _251;
    float _269 = exp2(_255);
    float _271 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _273 = _271 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _275 = _235 + _263;
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _281 = _241 + _265;
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _287 = fma(_145, _273, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _289 = fma(_145, _279, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _291 = fma(_273, _147, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _293 = fma(_145, _285, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _295 = fma(_279, _147, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _297 = fma(_285, _147, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _299 = _287 + _259;
    float _301 = _293 + _261;
    float _303 = _291 + _267;
    float _305 = _289 + _257;
    float _307 = _295 + _275;
    float _309 = _297 + _281;
    float _311 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].w, _163);
    float _313 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].w, _197);
    float _315 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].x, _299);
    float _317 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].y, _305);
    float _319 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].z, _301);
    float _321 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].x, _303);
    float _323 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].y, _307);
    float _325 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].z, _309);
    out.m_38.x = _315;
    out.m_38.y = _317;
    out.m_38.z = _319;
    out.m_38.w = _311;
    out.m_40.x = _321;
    out.m_40.y = _323;
    out.m_40.z = _325;
    out.m_40.w = _313;
    return out;
}


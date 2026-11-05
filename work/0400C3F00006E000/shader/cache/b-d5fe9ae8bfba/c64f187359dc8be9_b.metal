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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _61 = _55 + _59;
    float2 _449 = float2(_57, _55);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_449, float2(0.0), isnan(_449))).x;
    float _65 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _69 = _55 + _67;
    float _71 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _75 = _55 + _73;
    float2 _482 = float2(_57, _61);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float _79 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float2 _494 = float2(_57, _65);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float2 _502 = float2(_57, _69);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float2 _510 = float2(_57, _71);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_510, float2(0.0), isnan(_510))).x;
    float2 _518 = float2(_57, _75);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_518, float2(0.0), isnan(_518))).x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _91 = _55 + _89;
    float2 _532 = float2(_57, _79);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).x;
    float _95 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _99 = _55 + _97;
    float _101 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _103 = -(*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _105 = _55 + _103;
    float2 _561 = float2(_57, _91);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_561, float2(0.0), isnan(_561))).x;
    float _109 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float2 _573 = float2(_57, _95);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_573, float2(0.0), isnan(_573))).x;
    float2 _581 = float2(_57, _99);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float2 _589 = float2(_57, _101);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).x;
    float2 _597 = float2(_57, _105);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _121 = _55 + _119;
    float2 _611 = float2(_57, _109);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611))).x;
    float _125 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _129 = _55 + _127;
    float2 _629 = float2(_57, _121);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_629, float2(0.0), isnan(_629))).x;
    float2 _637 = float2(_57, _125);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_637, float2(0.0), isnan(_637))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_637, float2(0.0), isnan(_637))).x;
    float2 _645 = float2(_57, _129);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_645, float2(0.0), isnan(_645))).x;
    float _137 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _139 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _141 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _143 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _145 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _147 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _149 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _151 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _155 = _55 + _153;
    float _157 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _161 = _55 + _159;
    float _163 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _167 = _55 + _165;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[15].x;
    float _171 = _55 + _169;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _175 = _55 + _173;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[15].z;
    float _179 = _55 + _177;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _183 = _55 + _181;
    float _185 = _63 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _187 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[18].x, _185);
    float _189 = _55 + (*spvDescriptorSet0.fp_c3)._m0[15].z;
    float _191 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[18].x, _187);
    float _193 = _55 + (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _195 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].y, _191);
    float _197 = _55 + (*spvDescriptorSet0.fp_c3)._m0[15].x;
    float _199 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _195);
    float _201 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _203 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].z, _199);
    float _205 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _207 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[18].z, _203);
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _211 = _55 + _209;
    float _213 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[18].w, _207);
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _217 = _55 + _215;
    float _219 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[18].w, _213);
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _223 = _55 + _221;
    float _225 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[19].x, _219);
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _229 = _55 + _227;
    float _231 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[19].x, _225);
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _235 = _55 + _233;
    float _237 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[19].y, _231);
    float _239 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _241 = _55 + _239;
    float _243 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[19].y, _237);
    float _245 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _247 = _55 + _245;
    float _249 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].z, _243);
    float _251 = -(*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _253 = _55 + _251;
    float _255 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].z, _249);
    float _257 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float2 _888 = float2(_57, _257);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_888, float2(0.0), isnan(_888))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_888, float2(0.0), isnan(_888))).x;
    float2 _896 = float2(_57, _253);
    float _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_896, float2(0.0), isnan(_896))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_896, float2(0.0), isnan(_896))).x;
    float2 _904 = float2(_57, _137);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_904, float2(0.0), isnan(_904))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_904, float2(0.0), isnan(_904))).x;
    float2 _912 = float2(_57, _247);
    float _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_912, float2(0.0), isnan(_912))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_912, float2(0.0), isnan(_912))).x;
    float2 _920 = float2(_57, _139);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_920, float2(0.0), isnan(_920))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_920, float2(0.0), isnan(_920))).x;
    float2 _928 = float2(_57, _241);
    float _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_928, float2(0.0), isnan(_928))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_928, float2(0.0), isnan(_928))).x;
    float2 _936 = float2(_57, _141);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_936, float2(0.0), isnan(_936))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_936, float2(0.0), isnan(_936))).x;
    float2 _944 = float2(_57, _235);
    float _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944))).x;
    float2 _952 = float2(_57, _143);
    float _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_952, float2(0.0), isnan(_952))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_952, float2(0.0), isnan(_952))).x;
    float2 _960 = float2(_57, _229);
    float _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_960, float2(0.0), isnan(_960))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_960, float2(0.0), isnan(_960))).x;
    float2 _968 = float2(_57, _145);
    float _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_968, float2(0.0), isnan(_968))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_968, float2(0.0), isnan(_968))).x;
    float2 _976 = float2(_57, _223);
    float _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_976, float2(0.0), isnan(_976))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_976, float2(0.0), isnan(_976))).x;
    float2 _984 = float2(_57, _147);
    float _283 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_984, float2(0.0), isnan(_984))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_984, float2(0.0), isnan(_984))).x;
    float2 _992 = float2(_57, _217);
    float _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_992, float2(0.0), isnan(_992))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_992, float2(0.0), isnan(_992))).x;
    float2 _1000 = float2(_57, _149);
    float _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1000, float2(0.0), isnan(_1000))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1000, float2(0.0), isnan(_1000))).x;
    float2 _1008 = float2(_57, _211);
    float _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1008, float2(0.0), isnan(_1008))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1008, float2(0.0), isnan(_1008))).x;
    float2 _1016 = float2(_57, _151);
    float _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1016, float2(0.0), isnan(_1016))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1016, float2(0.0), isnan(_1016))).x;
    float2 _1024 = float2(_57, _155);
    float _293 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1024, float2(0.0), isnan(_1024))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1024, float2(0.0), isnan(_1024))).x;
    float2 _1032 = float2(_57, _157);
    float _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1032, float2(0.0), isnan(_1032))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1032, float2(0.0), isnan(_1032))).x;
    float2 _1040 = float2(_57, _161);
    float _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1040, float2(0.0), isnan(_1040))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1040, float2(0.0), isnan(_1040))).x;
    float2 _1048 = float2(_57, _163);
    float _299 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1048, float2(0.0), isnan(_1048))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1048, float2(0.0), isnan(_1048))).x;
    float _301 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[19].w, _255);
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _305 = _55 + _303;
    float _307 = _55 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float2 _1071 = float2(_57, _305);
    float _309 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1071, float2(0.0), isnan(_1071))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1071, float2(0.0), isnan(_1071))).x;
    float2 _1079 = float2(_57, _205);
    float _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1079, float2(0.0), isnan(_1079))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1079, float2(0.0), isnan(_1079))).x;
    float2 _1087 = float2(_57, _167);
    float _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1087, float2(0.0), isnan(_1087))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1087, float2(0.0), isnan(_1087))).x;
    float2 _1095 = float2(_57, _201);
    float _315 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1095, float2(0.0), isnan(_1095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1095, float2(0.0), isnan(_1095))).x;
    float2 _1103 = float2(_57, _171);
    float _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1103, float2(0.0), isnan(_1103))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1103, float2(0.0), isnan(_1103))).x;
    float2 _1111 = float2(_57, _197);
    float _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1111, float2(0.0), isnan(_1111))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1111, float2(0.0), isnan(_1111))).x;
    float2 _1119 = float2(_57, _175);
    float _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1119, float2(0.0), isnan(_1119))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1119, float2(0.0), isnan(_1119))).x;
    float2 _1127 = float2(_57, _193);
    float _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1127, float2(0.0), isnan(_1127))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1127, float2(0.0), isnan(_1127))).x;
    float2 _1135 = float2(_57, _179);
    float _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1135, float2(0.0), isnan(_1135))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1135, float2(0.0), isnan(_1135))).x;
    float2 _1143 = float2(_57, _189);
    float _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1143, float2(0.0), isnan(_1143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1143, float2(0.0), isnan(_1143))).x;
    float2 _1151 = float2(_57, _183);
    float _329 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1151, float2(0.0), isnan(_1151))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1151, float2(0.0), isnan(_1151))).x;
    float2 _1159 = float2(_57, _307);
    float _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1159, float2(0.0), isnan(_1159))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1159, float2(0.0), isnan(_1159))).x;
    float _333 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[19].w, _301);
    float _335 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[20].x, _333);
    float _337 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[20].x, _335);
    float _339 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[20].y, _337);
    float _341 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[20].y, _339);
    float _343 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[20].z, _341);
    float _345 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[20].z, _343);
    float _347 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[20].w, _345);
    float _349 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[20].w, _347);
    float _351 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[21].x, _349);
    float _353 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[21].x, _351);
    float _355 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[21].y, _353);
    float _357 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[21].y, _355);
    float _359 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[21].z, _357);
    float _361 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[21].z, _359);
    float _363 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[21].w, _361);
    float _365 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[21].w, _363);
    float _367 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[22].x, _365);
    float _369 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[22].x, _367);
    float _371 = fma(_297, (*spvDescriptorSet0.fp_c3)._m0[22].y, _369);
    float _373 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[22].y, _371);
    float _375 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[22].z, _373);
    float _377 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[22].z, _375);
    float _379 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[22].w, _377);
    float _381 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[22].w, _379);
    float _383 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[23].x, _381);
    float _385 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[23].x, _383);
    float _387 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[23].y, _385);
    float _389 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[23].y, _387);
    float _391 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[23].z, _389);
    float _393 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[23].z, _391);
    float _395 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[23].w, _393);
    float _397 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[23].w, _395);
    float _399 = _397 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _401 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _403 = _399 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = _405 * _401;
    out.m_32.x = _407;
    return out;
}


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
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float _63 = -(*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _65 = _59 + _63;
    float2 _421 = float2(_61, _59);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float _69 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _73 = _59 + _71;
    float _75 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _79 = _59 + _77;
    float2 _454 = float2(_61, _65);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_454, float2(0.0), isnan(_454))).x;
    float _83 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float2 _466 = float2(_61, _69);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466))).x;
    float2 _474 = float2(_61, _73);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).x;
    float2 _482 = float2(_61, _75);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float2 _490 = float2(_61, _79);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float _93 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _95 = _59 + _93;
    float2 _504 = float2(_61, _83);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_504, float2(0.0), isnan(_504))).x;
    float _99 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _103 = _59 + _101;
    float2 _523 = float2(_61, _95);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).x;
    float2 _531 = float2(_61, _99);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).x;
    float2 _539 = float2(_61, _103);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float _111 = in.m_33.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_33.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _125 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _129 = _59 + _127;
    float _131 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _135 = _59 + _133;
    float _137 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float2 _589 = float2(_61, _123);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).x;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _143 = _59 + _141;
    float _145 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _149 = _59 + _147;
    float _151 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _155 = _59 + _153;
    float _157 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _161 = _59 + _159;
    float _163 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _167 = _59 + _165;
    float _169 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _173 = _59 + _171;
    float _175 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _179 = _59 + _177;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _183 = _59 + _181;
    float _185 = _57 * _115;
    float _187 = _57 * _121;
    float _189 = -(*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _191 = _59 + _189;
    float2 _684 = float2(_61, _191);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_684, float2(0.0), isnan(_684))).x;
    float2 _692 = float2(_61, _125);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).x;
    float2 _700 = float2(_61, _129);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_700, float2(0.0), isnan(_700))).x;
    float2 _708 = float2(_61, _131);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_708, float2(0.0), isnan(_708))).x;
    float2 _716 = float2(_61, _135);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_716, float2(0.0), isnan(_716))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_716, float2(0.0), isnan(_716))).x;
    float2 _724 = float2(_61, _137);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724))).x;
    float2 _732 = float2(_61, _143);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_732, float2(0.0), isnan(_732))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_732, float2(0.0), isnan(_732))).x;
    float2 _740 = float2(_61, _145);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_740, float2(0.0), isnan(_740))).x;
    float2 _748 = float2(_61, _149);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_748, float2(0.0), isnan(_748))).x;
    float2 _756 = float2(_61, _151);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_756, float2(0.0), isnan(_756))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_756, float2(0.0), isnan(_756))).x;
    float2 _764 = float2(_61, _155);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_764, float2(0.0), isnan(_764))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_764, float2(0.0), isnan(_764))).x;
    float2 _772 = float2(_61, _157);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_772, float2(0.0), isnan(_772))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_772, float2(0.0), isnan(_772))).x;
    float2 _780 = float2(_61, _161);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_780, float2(0.0), isnan(_780))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_780, float2(0.0), isnan(_780))).x;
    float2 _788 = float2(_61, _163);
    float _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_788, float2(0.0), isnan(_788))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_788, float2(0.0), isnan(_788))).x;
    float2 _796 = float2(_61, _167);
    float _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_796, float2(0.0), isnan(_796))).x;
    float2 _804 = float2(_61, _169);
    float _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_804, float2(0.0), isnan(_804))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_804, float2(0.0), isnan(_804))).x;
    float2 _812 = float2(_61, _173);
    float _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_812, float2(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_812, float2(0.0), isnan(_812))).x;
    float2 _820 = float2(_61, _175);
    float _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_820, float2(0.0), isnan(_820))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_820, float2(0.0), isnan(_820))).x;
    float2 _828 = float2(_61, _179);
    float _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_828, float2(0.0), isnan(_828))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_828, float2(0.0), isnan(_828))).x;
    float _231 = _67 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _233 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[18].x, _231);
    float _235 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _237 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].x, _233);
    float _239 = -(*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _241 = _59 + _239;
    float2 _862 = float2(_61, _235);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_862, float2(0.0), isnan(_862))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_862, float2(0.0), isnan(_862))).x;
    float _245 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].y, _237);
    float _247 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float2 _879 = float2(_61, _241);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_879, float2(0.0), isnan(_879))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_879, float2(0.0), isnan(_879))).x;
    float _251 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[18].y, _245);
    float _253 = -(*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _255 = _59 + _253;
    float2 _898 = float2(_61, _247);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_898, float2(0.0), isnan(_898))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_898, float2(0.0), isnan(_898))).x;
    float _259 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[18].z, _251);
    float _261 = _59 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float2 _915 = float2(_61, _255);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_915, float2(0.0), isnan(_915))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_915, float2(0.0), isnan(_915))).x;
    float _265 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[18].z, _259);
    float _267 = -(*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _269 = _59 + _267;
    float2 _934 = float2(_61, _261);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_934, float2(0.0), isnan(_934))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_934, float2(0.0), isnan(_934))).x;
    float _273 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].w, _265);
    float _275 = _59 + (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float2 _951 = float2(_61, _269);
    float _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_951, float2(0.0), isnan(_951))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_951, float2(0.0), isnan(_951))).x;
    float _279 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[18].w, _273);
    float _281 = -(*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _283 = _59 + _281;
    float2 _970 = float2(_61, _275);
    float _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_970, float2(0.0), isnan(_970))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_970, float2(0.0), isnan(_970))).x;
    float _287 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[19].x, _279);
    float _289 = _59 + (*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _291 = _59 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float2 _992 = float2(_61, _283);
    float _293 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_992, float2(0.0), isnan(_992))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_992, float2(0.0), isnan(_992))).x;
    float2 _1000 = float2(_61, _289);
    float _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1000, float2(0.0), isnan(_1000))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1000, float2(0.0), isnan(_1000))).x;
    float2 _1008 = float2(_61, _183);
    float _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1008, float2(0.0), isnan(_1008))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1008, float2(0.0), isnan(_1008))).x;
    float2 _1016 = float2(_61, _291);
    float _299 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1016, float2(0.0), isnan(_1016))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1016, float2(0.0), isnan(_1016))).x;
    float2 _1024 = float2(_185, _187);
    float _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1024, float2(0.0), isnan(_1024))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1024, float2(0.0), isnan(_1024))).x;
    float _303 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[19].x, _287);
    float _305 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[19].y, _303);
    float _307 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[19].y, _305);
    float _309 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[19].z, _307);
    float _311 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[19].z, _309);
    float _313 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[19].w, _311);
    float _315 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[19].w, _313);
    float _317 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[20].x, _315);
    float _319 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[20].x, _317);
    float _321 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[20].y, _319);
    float _323 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[20].y, _321);
    float _325 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[20].z, _323);
    float _327 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[20].z, _325);
    float _329 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[20].w, _327);
    float _331 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[20].w, _329);
    float _333 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[21].x, _331);
    float _335 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[21].x, _333);
    float _337 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[21].y, _335);
    float _339 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[21].y, _337);
    float _341 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[21].z, _339);
    float _343 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[21].z, _341);
    float _345 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[21].w, _343);
    float _347 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _349 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[21].w, _345);
    float _351 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[22].x, _349);
    float _353 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[22].x, _351);
    float _355 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[22].y, _353);
    float _357 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[22].y, _355);
    float _359 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[22].z, _357);
    float _361 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[22].z, _359);
    float _363 = fma(_297, (*spvDescriptorSet0.fp_c3)._m0[22].w, _361);
    float _365 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[22].w, _363);
    float _367 = _365 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _369 = _367 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = -_301;
    float _375 = fma(_373, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _377 = _371 * _347;
    float _379 = _377 * _375;
    out.m_36.x = _379;
    return out;
}


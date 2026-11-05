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
    float2 _393 = float2(_57, _55);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float _65 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _69 = _55 + _67;
    float _71 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _75 = _55 + _73;
    float2 _426 = float2(_57, _61);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426))).x;
    float _79 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float2 _438 = float2(_57, _65);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float2 _446 = float2(_57, _69);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_446, float2(0.0), isnan(_446))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_446, float2(0.0), isnan(_446))).x;
    float2 _454 = float2(_57, _71);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_454, float2(0.0), isnan(_454))).x;
    float2 _462 = float2(_57, _75);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _91 = _55 + _89;
    float2 _476 = float2(_57, _79);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_476, float2(0.0), isnan(_476))).x;
    float2 _484 = float2(_57, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).x;
    float _97 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _101 = _55 + _99;
    float _103 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _107 = _55 + _105;
    float _109 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _111 = -(*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _113 = _55 + _111;
    float2 _523 = float2(_57, _97);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).x;
    float2 _531 = float2(_57, _101);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).x;
    float2 _539 = float2(_57, _103);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float2 _547 = float2(_57, _107);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).x;
    float2 _555 = float2(_57, _109);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float2 _563 = float2(_57, _113);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float _127 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _131 = _55 + _129;
    float _133 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _135 = -(*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _137 = _55 + _135;
    float _139 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _143 = _55 + _141;
    float2 _602 = float2(_57, _127);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float2(0.0), isnan(_602))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_602, float2(0.0), isnan(_602))).x;
    float2 _610 = float2(_57, _131);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).x;
    float2 _618 = float2(_57, _133);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_618, float2(0.0), isnan(_618))).x;
    float2 _626 = float2(_57, _137);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float2 _634 = float2(_57, _139);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).x;
    float2 _642 = float2(_57, _143);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float _157 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _159 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _161 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _165 = _55 + _163;
    float _167 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _171 = _55 + _169;
    float2 _679 = float2(_57, _157);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_679, float2(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_679, float2(0.0), isnan(_679))).x;
    float _175 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _179 = _55 + _177;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _183 = _55 + _181;
    float _185 = -(*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _187 = _55 + _185;
    float _189 = -(*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _191 = _55 + _189;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _195 = _55 + _193;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _199 = _55 + _197;
    float _201 = _63 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _203 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[18].x, _201);
    float _205 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _207 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[18].x, _203);
    float _209 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _211 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].y, _207);
    float _213 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _215 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _211);
    float _217 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _219 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].z, _215);
    float _221 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _223 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[18].z, _219);
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _227 = _55 + _225;
    float _229 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].w, _223);
    float _231 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _233 = _55 + _231;
    float _235 = _55 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float2 _805 = float2(_57, _233);
    float _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_805, float2(0.0), isnan(_805))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_805, float2(0.0), isnan(_805))).x;
    float2 _813 = float2(_57, _159);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_813, float2(0.0), isnan(_813))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_813, float2(0.0), isnan(_813))).x;
    float2 _821 = float2(_57, _227);
    float _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_821, float2(0.0), isnan(_821))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_821, float2(0.0), isnan(_821))).x;
    float2 _829 = float2(_57, _161);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_829, float2(0.0), isnan(_829))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_829, float2(0.0), isnan(_829))).x;
    float2 _837 = float2(_57, _165);
    float _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_837, float2(0.0), isnan(_837))).x;
    float2 _845 = float2(_57, _167);
    float _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_845, float2(0.0), isnan(_845))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_845, float2(0.0), isnan(_845))).x;
    float2 _853 = float2(_57, _171);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_853, float2(0.0), isnan(_853))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_853, float2(0.0), isnan(_853))).x;
    float2 _861 = float2(_57, _175);
    float _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_861, float2(0.0), isnan(_861))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_861, float2(0.0), isnan(_861))).x;
    float2 _869 = float2(_57, _179);
    float _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_869, float2(0.0), isnan(_869))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_869, float2(0.0), isnan(_869))).x;
    float2 _877 = float2(_57, _221);
    float _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_877, float2(0.0), isnan(_877))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_877, float2(0.0), isnan(_877))).x;
    float2 _885 = float2(_57, _183);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_885, float2(0.0), isnan(_885))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_885, float2(0.0), isnan(_885))).x;
    float2 _893 = float2(_57, _217);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_893, float2(0.0), isnan(_893))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_893, float2(0.0), isnan(_893))).x;
    float2 _901 = float2(_57, _187);
    float _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_901, float2(0.0), isnan(_901))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_901, float2(0.0), isnan(_901))).x;
    float2 _909 = float2(_57, _213);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_909, float2(0.0), isnan(_909))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_909, float2(0.0), isnan(_909))).x;
    float2 _917 = float2(_57, _191);
    float _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_917, float2(0.0), isnan(_917))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_917, float2(0.0), isnan(_917))).x;
    float2 _925 = float2(_57, _209);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_925, float2(0.0), isnan(_925))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_925, float2(0.0), isnan(_925))).x;
    float2 _933 = float2(_57, _195);
    float _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_933, float2(0.0), isnan(_933))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_933, float2(0.0), isnan(_933))).x;
    float2 _941 = float2(_57, _205);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_941, float2(0.0), isnan(_941))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_941, float2(0.0), isnan(_941))).x;
    float2 _949 = float2(_57, _199);
    float _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_949, float2(0.0), isnan(_949))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_949, float2(0.0), isnan(_949))).x;
    float2 _957 = float2(_57, _235);
    float _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_957, float2(0.0), isnan(_957))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_957, float2(0.0), isnan(_957))).x;
    float _277 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[18].w, _229);
    float _279 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[19].x, _277);
    float _281 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[19].x, _279);
    float _283 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[19].y, _281);
    float _285 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[19].y, _283);
    float _287 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].z, _285);
    float _289 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[19].z, _287);
    float _291 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[19].w, _289);
    float _293 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[19].w, _291);
    float _295 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[20].x, _293);
    float _297 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[20].x, _295);
    float _299 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[20].y, _297);
    float _301 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[20].y, _299);
    float _303 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[20].z, _301);
    float _305 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[20].z, _303);
    float _307 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[20].w, _305);
    float _309 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[20].w, _307);
    float _311 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[21].x, _309);
    float _313 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[21].x, _311);
    float _315 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[21].y, _313);
    float _317 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[21].y, _315);
    float _319 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[21].z, _317);
    float _321 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[21].z, _319);
    float _323 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[21].w, _321);
    float _325 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[21].w, _323);
    float _327 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[22].x, _325);
    float _329 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[22].x, _327);
    float _331 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[22].y, _329);
    float _333 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[22].y, _331);
    float _335 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[22].z, _333);
    float _337 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[22].z, _335);
    float _339 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[22].w, _337);
    float _341 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[22].w, _339);
    float _343 = _341 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _345 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _347 = _343 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = _349 * _345;
    out.m_32.x = _351;
    return out;
}


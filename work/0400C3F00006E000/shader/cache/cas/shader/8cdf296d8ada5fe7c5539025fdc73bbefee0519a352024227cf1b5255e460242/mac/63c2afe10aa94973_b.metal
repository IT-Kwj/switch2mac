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
    float2 _381 = float2(_61, _59);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).x;
    float2 _393 = float2(_61, _65);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _79 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _81 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _83 = _59 + _81;
    float _85 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _87 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _89 = _59 + _87;
    float _91 = _59 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float2 _437 = float2(_61, _77);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float _95 = -(*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _97 = _59 + _95;
    float _99 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _103 = _59 + _101;
    float _105 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _107 = -(*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _109 = _59 + _107;
    float _111 = in.m_33.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _121 = _59 + _119;
    float _123 = _59 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _127 = _59 + _125;
    float _129 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _133 = _59 + _131;
    float _135 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _139 = _59 + _137;
    float _141 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _145 = _59 + _143;
    float _147 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _151 = _59 + _149;
    float _153 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _157 = _59 + _155;
    float _159 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _163 = _59 + _161;
    float _165 = _57 * _75;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _169 = _59 + _167;
    float2 _570 = float2(_61, _169);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).x;
    float2 _578 = float2(_61, _79);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).x;
    float2 _586 = float2(_61, _83);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_586, float2(0.0), isnan(_586))).x;
    float2 _594 = float2(_61, _85);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_594, float2(0.0), isnan(_594))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_594, float2(0.0), isnan(_594))).x;
    float2 _602 = float2(_61, _89);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float2(0.0), isnan(_602))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_602, float2(0.0), isnan(_602))).x;
    float2 _610 = float2(_61, _91);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).x;
    float2 _618 = float2(_61, _97);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_618, float2(0.0), isnan(_618))).x;
    float2 _626 = float2(_61, _99);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float2 _634 = float2(_61, _103);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).x;
    float2 _642 = float2(_61, _105);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float2 _650 = float2(_61, _109);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_650, float2(0.0), isnan(_650))).x;
    float2 _658 = float2(_61, _117);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658))).x;
    float2 _666 = float2(_61, _121);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float2 _674 = float2(_61, _123);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_674, float2(0.0), isnan(_674))).x;
    float2 _682 = float2(_61, _127);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_682, float2(0.0), isnan(_682))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_682, float2(0.0), isnan(_682))).x;
    float2 _690 = float2(_61, _129);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).x;
    float2 _698 = float2(_61, _133);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_698, float2(0.0), isnan(_698))).x;
    float2 _706 = float2(_61, _135);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).x;
    float2 _714 = float2(_61, _139);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714))).x;
    float _209 = _57 * _115;
    float _211 = _59 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float2 _729 = float2(_61, _211);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_729, float2(0.0), isnan(_729))).x;
    float _215 = _67 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _217 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[18].x, _215);
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _221 = _59 + _219;
    float _223 = _59 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float2 _758 = float2(_61, _221);
    float _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_758, float2(0.0), isnan(_758))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_758, float2(0.0), isnan(_758))).x;
    float2 _766 = float2(_61, _141);
    float _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_766, float2(0.0), isnan(_766))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_766, float2(0.0), isnan(_766))).x;
    float2 _774 = float2(_61, _145);
    float _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_774, float2(0.0), isnan(_774))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_774, float2(0.0), isnan(_774))).x;
    float2 _782 = float2(_61, _147);
    float _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_782, float2(0.0), isnan(_782))).x;
    float2 _790 = float2(_61, _151);
    float _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_790, float2(0.0), isnan(_790))).x;
    float2 _798 = float2(_61, _153);
    float _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_798, float2(0.0), isnan(_798))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_798, float2(0.0), isnan(_798))).x;
    float2 _806 = float2(_61, _157);
    float _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_806, float2(0.0), isnan(_806))).x;
    float2 _814 = float2(_61, _159);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_814, float2(0.0), isnan(_814))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_814, float2(0.0), isnan(_814))).x;
    float2 _822 = float2(_61, _163);
    float _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_822, float2(0.0), isnan(_822))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_822, float2(0.0), isnan(_822))).x;
    float2 _830 = float2(_61, _223);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_830, float2(0.0), isnan(_830))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_830, float2(0.0), isnan(_830))).x;
    float2 _838 = float2(_209, _165);
    float _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_838, float2(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_838, float2(0.0), isnan(_838))).x;
    float _247 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[18].x, _217);
    float _249 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[18].y, _247);
    float _251 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[18].y, _249);
    float _253 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[18].z, _251);
    float _255 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[18].z, _253);
    float _257 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[18].w, _255);
    float _259 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[18].w, _257);
    float _261 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[19].x, _259);
    float _263 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[19].x, _261);
    float _265 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[19].y, _263);
    float _267 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[19].y, _265);
    float _269 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[19].z, _267);
    float _271 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[19].z, _269);
    float _273 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[19].w, _271);
    float _275 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[19].w, _273);
    float _277 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[20].x, _275);
    float _279 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[20].x, _277);
    float _281 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[20].y, _279);
    float _283 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[20].y, _281);
    float _285 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[20].z, _283);
    float _287 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[20].z, _285);
    float _289 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[20].w, _287);
    float _291 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[20].w, _289);
    float _293 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _295 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[21].x, _291);
    float _297 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[21].x, _295);
    float _299 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[21].y, _297);
    float _301 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[21].y, _299);
    float _303 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[21].z, _301);
    float _305 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[21].z, _303);
    float _307 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[21].w, _305);
    float _309 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[21].w, _307);
    float _311 = _309 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _313 = _311 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = -_315;
    float _319 = _317 + 1.0;
    float _321 = -_245;
    float _323 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _325 = abs(_319);
    float _327 = log2(_325);
    float _329 = _327 * 2.2000000476837158203125;
    float _331 = exp2(_329);
    float _333 = -_331;
    float _335 = _333 + 1.0;
    float _337 = _335 * _293;
    float _339 = _337 * _323;
    out.m_36.x = _339;
    return out;
}


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
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _63 = _57 + _61;
    float2 _449 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_449, float2(0.0), isnan(_449))).x;
    float _67 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = _57 + _69;
    float _73 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _77 = _57 + _75;
    float2 _481 = float2(_63, _59);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float _81 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float2 _493 = float2(_67, _59);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_493, float2(0.0), isnan(_493))).x;
    float2 _501 = float2(_71, _59);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_501, float2(0.0), isnan(_501))).x;
    float2 _509 = float2(_73, _59);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_509, float2(0.0), isnan(_509))).x;
    float2 _517 = float2(_77, _59);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_517, float2(0.0), isnan(_517))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_517, float2(0.0), isnan(_517))).x;
    float _91 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _93 = _57 + _91;
    float2 _531 = float2(_81, _59);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).x;
    float _97 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _101 = _57 + _99;
    float _103 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _107 = _57 + _105;
    float2 _559 = float2(_93, _59);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_559, float2(0.0), isnan(_559))).x;
    float _111 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float2 _571 = float2(_97, _59);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_571, float2(0.0), isnan(_571))).x;
    float2 _579 = float2(_101, _59);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_579, float2(0.0), isnan(_579))).x;
    float2 _587 = float2(_103, _59);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_587, float2(0.0), isnan(_587))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_587, float2(0.0), isnan(_587))).x;
    float2 _595 = float2(_107, _59);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_595, float2(0.0), isnan(_595))).x;
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _123 = _57 + _121;
    float2 _609 = float2(_111, _59);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
    float _127 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _131 = _57 + _129;
    float _133 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float2 _631 = float2(_123, _59);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_631, float2(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_631, float2(0.0), isnan(_631))).x;
    float2 _639 = float2(_127, _59);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).x;
    float2 _647 = float2(_131, _59);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_647, float2(0.0), isnan(_647))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_647, float2(0.0), isnan(_647))).x;
    float2 _655 = float2(_133, _59);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655))).x;
    float _143 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _147 = _57 + _145;
    float _149 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _153 = _57 + _151;
    float _155 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _159 = _57 + _157;
    float _161 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _165 = _57 + _163;
    float _167 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _171 = _57 + _169;
    float _173 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _175 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _177 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _179 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _183 = _57 + _181;
    float _185 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _187 = _65 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _189 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[18].x, _187);
    float _191 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _193 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].x, _189);
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _197 = _57 + _195;
    float _199 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _193);
    float _201 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _203 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].y, _199);
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _207 = _57 + _205;
    float _209 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[18].z, _203);
    float _211 = _57 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _213 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _209);
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _217 = _57 + _215;
    float _219 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].w, _213);
    float _221 = _57 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _223 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].w, _219);
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _227 = _57 + _225;
    float _229 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[19].x, _223);
    float _231 = _57 + (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _233 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[19].x, _229);
    float _235 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _237 = _57 + _235;
    float _239 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[19].y, _233);
    float _241 = _57 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _243 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].y, _239);
    float _245 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _247 = _57 + _245;
    float2 _870 = float2(_247, _59);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_870, float2(0.0), isnan(_870))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_870, float2(0.0), isnan(_870))).x;
    float2 _878 = float2(_143, _59);
    float _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_878, float2(0.0), isnan(_878))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_878, float2(0.0), isnan(_878))).x;
    float2 _886 = float2(_147, _59);
    float _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_886, float2(0.0), isnan(_886))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_886, float2(0.0), isnan(_886))).x;
    float2 _894 = float2(_149, _59);
    float _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_894, float2(0.0), isnan(_894))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_894, float2(0.0), isnan(_894))).x;
    float2 _902 = float2(_153, _59);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_902, float2(0.0), isnan(_902))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_902, float2(0.0), isnan(_902))).x;
    float2 _910 = float2(_155, _59);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_910, float2(0.0), isnan(_910))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_910, float2(0.0), isnan(_910))).x;
    float2 _918 = float2(_159, _59);
    float _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_918, float2(0.0), isnan(_918))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_918, float2(0.0), isnan(_918))).x;
    float2 _926 = float2(_161, _59);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_926, float2(0.0), isnan(_926))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_926, float2(0.0), isnan(_926))).x;
    float2 _934 = float2(_165, _59);
    float _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_934, float2(0.0), isnan(_934))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_934, float2(0.0), isnan(_934))).x;
    float2 _942 = float2(_167, _59);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_942, float2(0.0), isnan(_942))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_942, float2(0.0), isnan(_942))).x;
    float2 _950 = float2(_171, _59);
    float _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_950, float2(0.0), isnan(_950))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_950, float2(0.0), isnan(_950))).x;
    float2 _958 = float2(_173, _59);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_958, float2(0.0), isnan(_958))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_958, float2(0.0), isnan(_958))).x;
    float _273 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[19].z, _243);
    float _275 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _277 = _57 + _275;
    float _279 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[19].z, _273);
    float _281 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _283 = _57 + _281;
    float2 _988 = float2(_277, _59);
    float _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_988, float2(0.0), isnan(_988))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_988, float2(0.0), isnan(_988))).x;
    float2 _996 = float2(_175, _59);
    float _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_996, float2(0.0), isnan(_996))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_996, float2(0.0), isnan(_996))).x;
    float _289 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[19].w, _279);
    float _291 = -(*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _293 = _57 + _291;
    float2 _1015 = float2(_283, _59);
    float _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1015, float2(0.0), isnan(_1015))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1015, float2(0.0), isnan(_1015))).x;
    float2 _1023 = float2(_177, _59);
    float _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1023, float2(0.0), isnan(_1023))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1023, float2(0.0), isnan(_1023))).x;
    float2 _1031 = float2(_293, _59);
    float _299 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1031, float2(0.0), isnan(_1031))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1031, float2(0.0), isnan(_1031))).x;
    float2 _1039 = float2(_179, _59);
    float _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1039, float2(0.0), isnan(_1039))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1039, float2(0.0), isnan(_1039))).x;
    float2 _1047 = float2(_183, _59);
    float _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1047, float2(0.0), isnan(_1047))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1047, float2(0.0), isnan(_1047))).x;
    float2 _1055 = float2(_185, _59);
    float _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1055, float2(0.0), isnan(_1055))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1055, float2(0.0), isnan(_1055))).x;
    float _307 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[19].w, _289);
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _311 = _57 + _309;
    float2 _1074 = float2(_311, _59);
    float _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1074, float2(0.0), isnan(_1074))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1074, float2(0.0), isnan(_1074))).x;
    float2 _1082 = float2(_191, _59);
    float _315 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1082, float2(0.0), isnan(_1082))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1082, float2(0.0), isnan(_1082))).x;
    float2 _1090 = float2(_197, _59);
    float _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1090, float2(0.0), isnan(_1090))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1090, float2(0.0), isnan(_1090))).x;
    float2 _1098 = float2(_201, _59);
    float _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1098, float2(0.0), isnan(_1098))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1098, float2(0.0), isnan(_1098))).x;
    float2 _1106 = float2(_207, _59);
    float _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1106, float2(0.0), isnan(_1106))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1106, float2(0.0), isnan(_1106))).x;
    float2 _1114 = float2(_211, _59);
    float _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1114, float2(0.0), isnan(_1114))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1114, float2(0.0), isnan(_1114))).x;
    float2 _1122 = float2(_217, _59);
    float _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1122, float2(0.0), isnan(_1122))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1122, float2(0.0), isnan(_1122))).x;
    float2 _1130 = float2(_221, _59);
    float _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130))).x;
    float2 _1138 = float2(_227, _59);
    float _329 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1138, float2(0.0), isnan(_1138))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1138, float2(0.0), isnan(_1138))).x;
    float2 _1146 = float2(_231, _59);
    float _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1146, float2(0.0), isnan(_1146))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1146, float2(0.0), isnan(_1146))).x;
    float2 _1154 = float2(_237, _59);
    float _333 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1154, float2(0.0), isnan(_1154))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1154, float2(0.0), isnan(_1154))).x;
    float2 _1162 = float2(_57, _59);
    float _335 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1162, float2(0.0), isnan(_1162))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1162, float2(0.0), isnan(_1162))).x;
    float2 _1170 = float2(_241, _59);
    float _337 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1170, float2(0.0), isnan(_1170))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1170, float2(0.0), isnan(_1170))).x;
    float _339 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[20].x, _307);
    float _341 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[20].x, _339);
    float _343 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[20].y, _341);
    float _345 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[20].y, _343);
    float _347 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[20].z, _345);
    float _349 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[20].z, _347);
    float _351 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[20].w, _349);
    float _353 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[20].w, _351);
    float _355 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[21].x, _353);
    float _357 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[21].x, _355);
    float _359 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[21].y, _357);
    float _361 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[21].y, _359);
    float _363 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[21].z, _361);
    float _365 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[21].z, _363);
    float _367 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[21].w, _365);
    float _369 = fma(_297, (*spvDescriptorSet0.fp_c3)._m0[21].w, _367);
    float _371 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[22].x, _369);
    float _373 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[22].x, _371);
    float _375 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[22].y, _373);
    float _377 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[22].y, _375);
    float _379 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[22].z, _377);
    float _381 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[22].z, _379);
    float _383 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[22].w, _381);
    float _385 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[22].w, _383);
    float _387 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[23].x, _385);
    float _389 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[23].x, _387);
    float _391 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[23].y, _389);
    float _393 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[23].y, _391);
    float _395 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[23].z, _393);
    float _397 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[23].z, _395);
    float _399 = fma(_333, (*spvDescriptorSet0.fp_c3)._m0[23].w, _397);
    float _401 = -_335;
    float _403 = fma(_401, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _405 = fma(_337, (*spvDescriptorSet0.fp_c3)._m0[23].w, _399);
    float _407 = _405 * _403;
    out.m_34.x = _407;
    return out;
}


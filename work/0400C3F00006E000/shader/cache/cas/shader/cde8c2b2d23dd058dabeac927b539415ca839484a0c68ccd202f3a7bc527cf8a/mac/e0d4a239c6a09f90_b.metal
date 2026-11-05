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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _61 = _55 + _59;
    float2 _439 = float2(_55, _57);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).x;
    float _65 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _69 = _55 + _67;
    float _71 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _75 = _55 + _73;
    float2 _471 = float2(_61, _57);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).x;
    float _79 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float2 _483 = float2(_65, _57);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float2 _491 = float2(_69, _57);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).x;
    float2 _499 = float2(_71, _57);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).x;
    float2 _507 = float2(_75, _57);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_507, float2(0.0), isnan(_507))).x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _91 = _55 + _89;
    float2 _521 = float2(_79, _57);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_521, float2(0.0), isnan(_521))).x;
    float _95 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _99 = _55 + _97;
    float _101 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _103 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _105 = _55 + _103;
    float2 _549 = float2(_91, _57);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_549, float2(0.0), isnan(_549))).x;
    float _109 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float2 _561 = float2(_95, _57);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_561, float2(0.0), isnan(_561))).x;
    float2 _569 = float2(_99, _57);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).x;
    float2 _577 = float2(_101, _57);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_577, float2(0.0), isnan(_577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_577, float2(0.0), isnan(_577))).x;
    float2 _585 = float2(_105, _57);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_585, float2(0.0), isnan(_585))).x;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _121 = _55 + _119;
    float2 _599 = float2(_109, _57);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_599, float2(0.0), isnan(_599))).x;
    float _125 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _129 = _55 + _127;
    float2 _617 = float2(_121, _57);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_617, float2(0.0), isnan(_617))).x;
    float2 _625 = float2(_125, _57);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_625, float2(0.0), isnan(_625))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_625, float2(0.0), isnan(_625))).x;
    float2 _633 = float2(_129, _57);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_633, float2(0.0), isnan(_633))).x;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _139 = _55 + _137;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _143 = _55 + _141;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _147 = _55 + _145;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _151 = _55 + _149;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _155 = _55 + _153;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _159 = _55 + _157;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _163 = _55 + _161;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _167 = _55 + _165;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _171 = _55 + _169;
    float _173 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _177 = _55 + _175;
    float _179 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _183 = _55 + _181;
    float _185 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _187 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _189 = _55 + _187;
    float _191 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _195 = _55 + _193;
    float _197 = _63 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _199 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[18].x, _197);
    float _201 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _203 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[18].x, _199);
    float _205 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float2 _763 = float2(_201, _57);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_763, float2(0.0), isnan(_763))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_763, float2(0.0), isnan(_763))).x;
    float2 _771 = float2(_139, _57);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_771, float2(0.0), isnan(_771))).x;
    float _211 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].y, _203);
    float _213 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float2 _788 = float2(_205, _57);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_788, float2(0.0), isnan(_788))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_788, float2(0.0), isnan(_788))).x;
    float2 _796 = float2(_143, _57);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_796, float2(0.0), isnan(_796))).x;
    float _219 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _211);
    float _221 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float2 _813 = float2(_213, _57);
    float _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_813, float2(0.0), isnan(_813))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_813, float2(0.0), isnan(_813))).x;
    float2 _821 = float2(_147, _57);
    float _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_821, float2(0.0), isnan(_821))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_821, float2(0.0), isnan(_821))).x;
    float _227 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].z, _219);
    float _229 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float2 _838 = float2(_221, _57);
    float _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_838, float2(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_838, float2(0.0), isnan(_838))).x;
    float2 _846 = float2(_151, _57);
    float _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_846, float2(0.0), isnan(_846))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_846, float2(0.0), isnan(_846))).x;
    float _235 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[18].z, _227);
    float _237 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _863 = float2(_229, _57);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_863, float2(0.0), isnan(_863))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_863, float2(0.0), isnan(_863))).x;
    float2 _871 = float2(_155, _57);
    float _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_871, float2(0.0), isnan(_871))).x;
    float _243 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[18].w, _235);
    float _245 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _888 = float2(_237, _57);
    float _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_888, float2(0.0), isnan(_888))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_888, float2(0.0), isnan(_888))).x;
    float2 _896 = float2(_159, _57);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_896, float2(0.0), isnan(_896))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_896, float2(0.0), isnan(_896))).x;
    float _251 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[18].w, _243);
    float _253 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float2 _913 = float2(_245, _57);
    float _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_913, float2(0.0), isnan(_913))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_913, float2(0.0), isnan(_913))).x;
    float2 _921 = float2(_163, _57);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_921, float2(0.0), isnan(_921))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_921, float2(0.0), isnan(_921))).x;
    float _259 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[19].x, _251);
    float _261 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float2 _939 = float2(_253, _57);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_939, float2(0.0), isnan(_939))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_939, float2(0.0), isnan(_939))).x;
    float2 _947 = float2(_167, _57);
    float _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_947, float2(0.0), isnan(_947))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_947, float2(0.0), isnan(_947))).x;
    float2 _955 = float2(_261, _57);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_955, float2(0.0), isnan(_955))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_955, float2(0.0), isnan(_955))).x;
    float2 _963 = float2(_171, _57);
    float _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_963, float2(0.0), isnan(_963))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_963, float2(0.0), isnan(_963))).x;
    float2 _971 = float2(_173, _57);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_971, float2(0.0), isnan(_971))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_971, float2(0.0), isnan(_971))).x;
    float2 _979 = float2(_177, _57);
    float _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_979, float2(0.0), isnan(_979))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_979, float2(0.0), isnan(_979))).x;
    float2 _987 = float2(_179, _57);
    float _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_987, float2(0.0), isnan(_987))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_987, float2(0.0), isnan(_987))).x;
    float2 _995 = float2(_183, _57);
    float _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_995, float2(0.0), isnan(_995))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_995, float2(0.0), isnan(_995))).x;
    float2 _1003 = float2(_185, _57);
    float _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1003, float2(0.0), isnan(_1003))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1003, float2(0.0), isnan(_1003))).x;
    float2 _1011 = float2(_189, _57);
    float _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1011, float2(0.0), isnan(_1011))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1011, float2(0.0), isnan(_1011))).x;
    float2 _1019 = float2(_191, _57);
    float _283 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1019, float2(0.0), isnan(_1019))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1019, float2(0.0), isnan(_1019))).x;
    float2 _1027 = float2(_195, _57);
    float _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1027, float2(0.0), isnan(_1027))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1027, float2(0.0), isnan(_1027))).x;
    float _287 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[19].x, _259);
    float _289 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _291 = _55 + _289;
    float _293 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[19].y, _287);
    float _295 = _55 + (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _297 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[19].y, _293);
    float _299 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _301 = _55 + _299;
    float _303 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].z, _297);
    float _305 = _55 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _307 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].z, _303);
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _311 = _55 + _309;
    float _313 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[19].w, _307);
    float _315 = _55 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _317 = _55 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float2 _1099 = float2(_315, _57);
    float _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1099, float2(0.0), isnan(_1099))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1099, float2(0.0), isnan(_1099))).x;
    float2 _1107 = float2(_311, _57);
    float _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1107, float2(0.0), isnan(_1107))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1107, float2(0.0), isnan(_1107))).x;
    float2 _1115 = float2(_305, _57);
    float _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1115, float2(0.0), isnan(_1115))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1115, float2(0.0), isnan(_1115))).x;
    float2 _1123 = float2(_301, _57);
    float _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1123, float2(0.0), isnan(_1123))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1123, float2(0.0), isnan(_1123))).x;
    float2 _1131 = float2(_295, _57);
    float _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1131, float2(0.0), isnan(_1131))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1131, float2(0.0), isnan(_1131))).x;
    float2 _1139 = float2(_291, _57);
    float _329 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1139, float2(0.0), isnan(_1139))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1139, float2(0.0), isnan(_1139))).x;
    float2 _1147 = float2(_317, _57);
    float _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1147, float2(0.0), isnan(_1147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1147, float2(0.0), isnan(_1147))).x;
    float _333 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[19].w, _313);
    float _335 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[20].x, _333);
    float _337 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[20].x, _335);
    float _339 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[20].y, _337);
    float _341 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[20].y, _339);
    float _343 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[20].z, _341);
    float _345 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[20].z, _343);
    float _347 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[20].w, _345);
    float _349 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[20].w, _347);
    float _351 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[21].x, _349);
    float _353 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[21].x, _351);
    float _355 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[21].y, _353);
    float _357 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[21].y, _355);
    float _359 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[21].z, _357);
    float _361 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[21].z, _359);
    float _363 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[21].w, _361);
    float _365 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[21].w, _363);
    float _367 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[22].x, _365);
    float _369 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[22].x, _367);
    float _371 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[22].y, _369);
    float _373 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[22].y, _371);
    float _375 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[22].z, _373);
    float _377 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[22].z, _375);
    float _379 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[22].w, _377);
    float _381 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[22].w, _379);
    float _383 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[23].x, _381);
    float _385 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[23].x, _383);
    float _387 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[23].y, _385);
    float _389 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[23].y, _387);
    float _391 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[23].z, _389);
    float _393 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[23].z, _391);
    float _395 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[23].w, _393);
    float _397 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[23].w, _395);
    out.m_32.x = _397;
    return out;
}


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
    float2 _393 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float _67 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = _57 + _69;
    float _73 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _77 = _57 + _75;
    float2 _425 = float2(_63, _59);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_425, float2(0.0), isnan(_425))).x;
    float _81 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float2 _437 = float2(_67, _59);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float2 _445 = float2(_71, _59);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445))).x;
    float2 _453 = float2(_73, _59);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_453, float2(0.0), isnan(_453))).x;
    float2 _461 = float2(_77, _59);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461))).x;
    float _91 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _93 = _57 + _91;
    float2 _475 = float2(_81, _59);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).x;
    float _97 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _487 = float2(_93, _59);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_487, float2(0.0), isnan(_487))).x;
    float2 _495 = float2(_97, _59);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float _103 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _105 = _57 + _103;
    float _107 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _109 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _111 = _57 + _109;
    float _113 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _117 = _57 + _115;
    float _119 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float2 _533 = float2(_105, _59);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_533, float2(0.0), isnan(_533))).x;
    float2 _541 = float2(_107, _59);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_541, float2(0.0), isnan(_541))).x;
    float2 _549 = float2(_111, _59);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_549, float2(0.0), isnan(_549))).x;
    float2 _557 = float2(_113, _59);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_557, float2(0.0), isnan(_557))).x;
    float2 _565 = float2(_117, _59);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_565, float2(0.0), isnan(_565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_565, float2(0.0), isnan(_565))).x;
    float2 _573 = float2(_119, _59);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_573, float2(0.0), isnan(_573))).x;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _135 = _57 + _133;
    float _137 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _139 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _141 = _57 + _139;
    float _143 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _147 = _57 + _145;
    float _149 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float2 _612 = float2(_135, _59);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_612, float2(0.0), isnan(_612))).x;
    float2 _620 = float2(_137, _59);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).x;
    float2 _628 = float2(_141, _59);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_628, float2(0.0), isnan(_628))).x;
    float2 _636 = float2(_143, _59);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float2 _644 = float2(_147, _59);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644))).x;
    float2 _652 = float2(_149, _59);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_652, float2(0.0), isnan(_652))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_652, float2(0.0), isnan(_652))).x;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _165 = _57 + _163;
    float _167 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _171 = _57 + _169;
    float _173 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _177 = _57 + _175;
    float _179 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _691 = float2(_165, _59);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_691, float2(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_691, float2(0.0), isnan(_691))).x;
    float2 _699 = float2(_167, _59);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_699, float2(0.0), isnan(_699))).x;
    float2 _707 = float2(_171, _59);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_707, float2(0.0), isnan(_707))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_707, float2(0.0), isnan(_707))).x;
    float2 _715 = float2(_173, _59);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_715, float2(0.0), isnan(_715))).x;
    float2 _723 = float2(_177, _59);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).x;
    float2 _731 = float2(_179, _59);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_731, float2(0.0), isnan(_731))).x;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _195 = _57 + _193;
    float _197 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _201 = _57 + _199;
    float _203 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float2 _760 = float2(_195, _59);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_760, float2(0.0), isnan(_760))).x;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _209 = _57 + _207;
    float _211 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float2 _778 = float2(_197, _59);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_778, float2(0.0), isnan(_778))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_778, float2(0.0), isnan(_778))).x;
    float2 _786 = float2(_201, _59);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_786, float2(0.0), isnan(_786))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_786, float2(0.0), isnan(_786))).x;
    float _217 = _65 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _219 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[18].x, _217);
    float _221 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _223 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].x, _219);
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _227 = _57 + _225;
    float2 _820 = float2(_221, _59);
    float _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_820, float2(0.0), isnan(_820))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_820, float2(0.0), isnan(_820))).x;
    float _231 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _223);
    float _233 = _57 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float2 _837 = float2(_227, _59);
    float _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_837, float2(0.0), isnan(_837))).x;
    float _237 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].y, _231);
    float _239 = -(*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _241 = _57 + _239;
    float2 _856 = float2(_233, _59);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_856, float2(0.0), isnan(_856))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_856, float2(0.0), isnan(_856))).x;
    float _245 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[18].z, _237);
    float _247 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float2 _873 = float2(_241, _59);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_873, float2(0.0), isnan(_873))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_873, float2(0.0), isnan(_873))).x;
    float _251 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _245);
    float _253 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _255 = _57 + _253;
    float2 _892 = float2(_247, _59);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_892, float2(0.0), isnan(_892))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_892, float2(0.0), isnan(_892))).x;
    float _259 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[18].w, _251);
    float _261 = _57 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float2 _909 = float2(_255, _59);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_909, float2(0.0), isnan(_909))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_909, float2(0.0), isnan(_909))).x;
    float _265 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[18].w, _259);
    float _267 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _269 = _57 + _267;
    float2 _928 = float2(_261, _59);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_928, float2(0.0), isnan(_928))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_928, float2(0.0), isnan(_928))).x;
    float2 _936 = float2(_269, _59);
    float _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_936, float2(0.0), isnan(_936))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_936, float2(0.0), isnan(_936))).x;
    float2 _944 = float2(_203, _59);
    float _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944))).x;
    float2 _952 = float2(_209, _59);
    float _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_952, float2(0.0), isnan(_952))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_952, float2(0.0), isnan(_952))).x;
    float2 _960 = float2(_57, _59);
    float _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_960, float2(0.0), isnan(_960))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_960, float2(0.0), isnan(_960))).x;
    float2 _968 = float2(_211, _59);
    float _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_968, float2(0.0), isnan(_968))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_968, float2(0.0), isnan(_968))).x;
    float _283 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[19].x, _265);
    float _285 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[19].x, _283);
    float _287 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].y, _285);
    float _289 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[19].y, _287);
    float _291 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[19].z, _289);
    float _293 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].z, _291);
    float _295 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[19].w, _293);
    float _297 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[19].w, _295);
    float _299 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[20].x, _297);
    float _301 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[20].x, _299);
    float _303 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[20].y, _301);
    float _305 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[20].y, _303);
    float _307 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[20].z, _305);
    float _309 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[20].z, _307);
    float _311 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[20].w, _309);
    float _313 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[20].w, _311);
    float _315 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[21].x, _313);
    float _317 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[21].x, _315);
    float _319 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[21].y, _317);
    float _321 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[21].y, _319);
    float _323 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[21].z, _321);
    float _325 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[21].z, _323);
    float _327 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[21].w, _325);
    float _329 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[21].w, _327);
    float _331 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[22].x, _329);
    float _333 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[22].x, _331);
    float _335 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[22].y, _333);
    float _337 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[22].y, _335);
    float _339 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[22].z, _337);
    float _341 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[22].z, _339);
    float _343 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[22].w, _341);
    float _345 = -_279;
    float _347 = fma(_345, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _349 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[22].w, _343);
    float _351 = _349 * _347;
    out.m_34.x = _351;
    return out;
}


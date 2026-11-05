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
    float _53 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _55 = 1.0 / _39;
    float _57 = _55 * _45;
    float _59 = _55 * _51;
    float _61 = fma(_53, -0.5, _57);
    float _63 = fma(_53, -0.5, _59);
    float _65 = fma(_53, 0.5, _57);
    float2 _210 = float2(_61, _63);
    float2 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_210, float2(0.0), isnan(_210))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_210, float2(0.0), isnan(_210))).xy;
    float _71 = _69.x;
    float _73 = _69.y;
    float2 _225 = float2(_65, _63);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_225, float2(0.0), isnan(_225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_225, float2(0.0), isnan(_225))).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = fma(_53, 1.5, _57);
    float _83 = fma(_53, 0.5, _59);
    float _85 = fma(_53, 1.5, _59);
    float2 _247 = float2(_81, _63);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_247, float2(0.0), isnan(_247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_247, float2(0.0), isnan(_247))).x;
    float2 _255 = float2(_81, _83);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_255, float2(0.0), isnan(_255))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_255, float2(0.0), isnan(_255))).x;
    float2 _263 = float2(_81, _85);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).x;
    float2 _271 = float2(_61, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_271, float2(0.0), isnan(_271))).x;
    float2 _279 = float2(_65, _85);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_279, float2(0.0), isnan(_279))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_279, float2(0.0), isnan(_279))).x;
    float2 _287 = float2(_61, _83);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float2 _299 = float2(_65, _83);
    float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299))).xy;
    float _105 = _103.x;
    float _107 = _103.y;
    bool _111 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[3].y;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _119 = _115 || _117;
    float _121 = precise::max(_71, _77);
    if (!_119)
    {
        float _123 = precise::max(_105, _89);
        float _125 = precise::max(_93, _95);
        float _127 = precise::min(_105, _89);
        float _129 = precise::min(_93, _95);
        float _131 = precise::max(_87, _99);
        float _133 = precise::max(_123, _125);
        float _135 = precise::min(_71, _77);
        float _137 = precise::min(_87, _99);
        float _139 = precise::min(_127, _129);
        float _141 = precise::max(_121, _131);
        float _143 = precise::max(_91, _133);
        float _145 = precise::min(_135, _137);
        float _147 = precise::min(_91, _139);
        float _149 = precise::max(_141, _143);
        float _151 = precise::min(_145, _147);
        out.m_32.x = _149;
        out.m_32.y = _151;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _153 = precise::max(_99, _105);
    float _155 = precise::min(_73, _79);
    float _157 = precise::min(_101, _107);
    float _159 = precise::max(_121, _153);
    float _161 = precise::min(_155, _157);
    out.m_32.x = _159;
    out.m_32.y = _161;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}


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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
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
    float4 m_26 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = gl_FragCoord.y;
    float _37 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _39 = _35 / _37;
    float _41 = gl_FragCoord.x;
    float _43 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _45 = _41 / _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * 0.00390625;
    float _51 = _39 * _49;
    float _53 = _45 * _49;
    float _55 = _51 + (-0.03125);
    float _57 = _51 + (-0.03515625);
    float _59 = _51 + (-0.02734375);
    float _61 = _51 + (-0.0234375);
    float _63 = _51 + (-0.01953125);
    float _65 = _51 + (-0.015625);
    float2 _232 = float2(_53, _55);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_232, float2(0.0), isnan(_232))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_232, float2(0.0), isnan(_232))).x;
    float2 _244 = float2(_53, _57);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_244, float2(0.0), isnan(_244))).x;
    float2 _252 = float2(_53, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float2(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float2(0.0), isnan(_252))).x;
    float2 _260 = float2(_53, _61);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_260, float2(0.0), isnan(_260))).x;
    float2 _268 = float2(_53, _63);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_268, float2(0.0), isnan(_268))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_268, float2(0.0), isnan(_268))).x;
    float2 _276 = float2(_53, _65);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_276, float2(0.0), isnan(_276))).x;
    float _79 = _51 + (-0.01171875);
    float _81 = _51 + (-0.0078125);
    float _83 = _51 + (-0.00390625);
    float _85 = _51 + 0.00390625;
    float _87 = _51 + 0.0078125;
    float _89 = _51 + 0.01171875;
    float2 _301 = float2(_53, _79);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).x;
    float2 _309 = float2(_53, _81);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).x;
    float2 _317 = float2(_53, _83);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_317, float2(0.0), isnan(_317))).x;
    float2 _325 = float2(_53, _51);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_325, float2(0.0), isnan(_325))).x;
    float2 _333 = float2(_53, _85);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333))).x;
    float2 _341 = float2(_53, _87);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).x;
    float2 _349 = float2(_53, _89);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349))).x;
    float _105 = _51 + 0.015625;
    float _107 = _51 + 0.01953125;
    float _109 = _51 + 0.0234375;
    float _111 = _51 + 0.02734375;
    float2 _369 = float2(_53, _105);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).x;
    float2 _377 = float2(_53, _107);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).x;
    float2 _385 = float2(_53, _109);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).x;
    float2 _393 = float2(_53, _111);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float _121 = _51 + 0.03125;
    float _123 = _51 + 0.03515625;
    float2 _407 = float2(_53, _121);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407))).x;
    float2 _415 = float2(_53, _123);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_415, float2(0.0), isnan(_415))).x;
    float2 _423 = float2(_53, _51);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_423, float2(0.0), isnan(_423))).w;
    float _131 = _67 * 0.0319039933383464813232421875;
    float _133 = fma(_69, 0.020628057420253753662109375, _131);
    float _135 = fma(_71, 0.048904143273830413818359375, _133);
    float _137 = fma(_73, 0.072541870176792144775390625, _135);
    float _139 = fma(_75, 0.10664616525173187255859375, _137);
    float _141 = fma(_77, 0.15314050018787384033203125, _139);
    float _143 = fma(_91, 0.21902985870838165283203125, _141);
    float _145 = fma(_93, 0.3112169206142425537109375, _143);
    float _147 = fma(_95, 0.451655864715576171875, _145);
    float _149 = fma(_97, 0.69422256946563720703125, _147);
    float _151 = fma(_99, 0.451655864715576171875, _149);
    float _153 = fma(_101, 0.3112169206142425537109375, _151);
    float _155 = fma(_103, 0.21902985870838165283203125, _153);
    float _157 = fma(_113, 0.15314050018787384033203125, _155);
    float _159 = fma(_115, 0.10664616525173187255859375, _157);
    float _161 = fma(_117, 0.072541870176792144775390625, _159);
    float _163 = fma(_119, 0.048904143273830413818359375, _161);
    float _165 = fma(_125, 0.0319039933383464813232421875, _163);
    float _167 = fma(_127, 0.020628057420253753662109375, _165);
    float _169 = -_129;
    float _171 = _169 + (-0.0);
    float _173 = -_167;
    float _175 = _173 + (-0.0);
    out.m_26.x = _175;
    out.m_26.y = _171;
    return out;
}


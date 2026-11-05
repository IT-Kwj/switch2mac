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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
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
    bool _177 = false;
    float _41 = gl_FragCoord.w;
    float _43 = gl_FragCoord.y;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = gl_FragCoord.x;
    float _57 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _59 = _55 / _57;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _63 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _61;
    float _65 = (*spvDescriptorSet0.fp_c4)._m0[5].z * 0.001000000047497451305389404296875;
    float _67 = 1.0 / _63;
    float _69 = 1.0 / _41;
    float _71 = _47 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _73 = _59 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _75 = _71 * _71;
    float _77 = _75 * _65;
    float _79 = fma(_73, 2.0, -1.0);
    float _81 = _69 * _53;
    float _83 = _77 * _77;
    float _85 = _81 * _77;
    float _87 = _85 * 2.0;
    float _89 = fma(_81, _81, _83);
    float _91 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _93 = _81 + _91;
    bool _97 = _79 >= 0.0;
    float _99 = fma(_81, _79, _77);
    float _101 = fma(_79, _87, _89);
    float _103 = _93 * _67;
    float _105 = rsqrt(_101);
    float _107 = sqrt(_103);
    float _109 = sqrt(_101);
    float _111 = _99 * _105;
    bool _113 = !_97;
    float _171;
    float _173;
    float _175;
    if (!_113)
    {
        float _115 = fma(_111, 350.80767822265625, 53.62115478515625);
        float _117 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _119 = _109 + _117;
        float _121 = fma(_73, 701.6153564453125, -297.1865234375);
        float _123 = _119 * _67;
        float _125 = log2(_115);
        float _127 = sqrt(_123);
        float _129 = _125 * 0.1155245304107666015625;
        float _131 = log2(_121);
        float2 _390 = float2(_129, _127);
        float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390))).xyz;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        float _143 = _131 * 0.1155245304107666015625;
        float2 _408 = float2(_143, _107);
        float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).xyz;
        float _147 = _145.x;
        float _149 = _145.y;
        float _151 = _145.z;
        float _153 = precise::max(_137, 9.9999999747524270787835121154785e-07);
        float _155 = precise::max(_139, 9.9999999747524270787835121154785e-07);
        float _157 = precise::max(_141, 9.9999999747524270787835121154785e-07);
        float _159 = 1.0 / _153;
        float _161 = 1.0 / _155;
        float _163 = 1.0 / _157;
        float _165 = _147 * _159;
        float _167 = _149 * _161;
        float _169 = _151 * _163;
        _171 = _165;
        _173 = _167;
        _175 = _169;
        _177 = true;
    }
    else
    {
        float _179 = fma(_73, -701.6153564453125, 404.428802490234375);
        float _181 = fma(_111, -350.80767822265625, 53.62115478515625);
        float _183 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _185 = _109 + _183;
        float _187 = log2(_179);
        float _189 = _185 * _67;
        float _191 = log2(_181);
        float _193 = _187 * 0.1155245304107666015625;
        float _195 = sqrt(_189);
        float2 _473 = float2(_193, _107);
        float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_473, float2(0.0), isnan(_473))).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        float _205 = _191 * 0.1155245304107666015625;
        float2 _489 = float2(_205, _195);
        float3 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_489, float2(0.0), isnan(_489))).xyz;
        float _209 = _207.x;
        float _211 = _207.y;
        float _213 = _207.z;
        float _215 = precise::max(_199, 9.9999999747524270787835121154785e-07);
        float _217 = precise::max(_203, 9.9999999747524270787835121154785e-07);
        float _219 = precise::max(_201, 9.9999999747524270787835121154785e-07);
        float _221 = 1.0 / _215;
        float _223 = 1.0 / _219;
        float _225 = 1.0 / _217;
        float _227 = _209 * _221;
        float _229 = _211 * _223;
        float _231 = _213 * _225;
        _171 = _227;
        _173 = _229;
        _175 = _231;
    }
    _177 = false;
    float _233 = _171;
    float _235 = _173;
    float _237 = _175;
    float _239 = precise::min(_233, 1.0);
    float _241 = precise::min(_235, 1.0);
    float _243 = precise::min(_237, 1.0);
    out.m_34.x = _239;
    out.m_34.y = _241;
    out.m_34.z = _243;
    out.m_34.w = 0.0;
    return out;
}


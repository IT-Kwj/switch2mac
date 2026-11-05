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
    float2 _231 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_231, float2(0.0), isnan(_231))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    bool _71 = _55 >= (*spvDescriptorSet0.fp_c3)._m0[35].x;
    bool _73 = isnan(_55);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.fp_c3)._m0[35].x);
    bool _79 = _75 || _77;
    float _81 = precise::min(_65, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _83 = precise::min(_63, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _85 = precise::min(_67, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _87 = _81 * 0.715200006961822509765625;
    float _89 = fma(_83, 0.2125999927520751953125, _87);
    float _91 = fma(_85, 0.072200000286102294921875, _89);
    float _93 = 1.0 / _91;
    float _95 = _93 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = _91 * _99;
    float _115 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _117 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _119 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _121 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[11].z, _115);
    float _123 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[11].x, _117);
    float _129 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[12].z, _121);
    float _131 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[11].w, _119);
    float _137 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[13].z, _129);
    float _143 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[12].x, _127);
    float _145 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[12].w, _135);
    float _147 = _83 * _99;
    float _149 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[14].z, _141);
    float _151 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[13].x, _143);
    float _153 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[13].w, _145);
    float _155 = _81 * _99;
    float _157 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[15].z, _149);
    float _159 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[14].x, _151);
    float _161 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[14].w, _153);
    float _163 = _85 * _99;
    float _165 = _157;
    if (!_79)
    {
        float _167 = _157 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _165 = _167;
    }
    float _169 = _165;
    float _171 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[15].x, _159);
    float _173 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[15].w, _161);
    float _175 = _169 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _177 = -_171;
    float _179 = _113 + _177;
    float _181 = -_175;
    float _183 = _181 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _185 = _173 * _179;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[34].z, _175);
    float _191 = _189 * _187;
    float _193 = _147 * _191;
    float _195 = _155 * _191;
    float _197 = _163 * _191;
    out.m_32.x = _193;
    out.m_32.y = _195;
    out.m_32.z = _197;
    out.m_32.w = 0.0;
    return out;
}


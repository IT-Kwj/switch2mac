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
    float4 m_36 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_34 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_29.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_29.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    bool _75 = _69 > (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _77 = _71 > (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _79 = _77 || _75;
    float _81 = _65;
    if (_79)
    {
        discard_fragment();
    }
    if (_79)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _83 = in.m_34.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_36.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_38.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_40.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_40.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _67 * _87;
    float _115 = _67 * _93;
    float _117 = _67 * _99;
    float _119 = _113 * 0.5;
    float _121 = _67 * _111;
    bool _123 = _115 >= _119;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    bool _129 = isnan(_119);
    bool _131 = _127 || _129;
    float _133 = _99;
    if (_131)
    {
        float _135 = _117 * 0.5;
        _133 = _135;
    }
    float _137 = _133;
    float _139 = 0.0;
    if (!_131)
    {
        float _141 = 1.0 / _119;
        _139 = _141;
    }
    float _143 = _139;
    if (_131)
    {
        float _145 = -_119;
        float _147 = _145 + _115;
        _81 = _147;
    }
    float _149 = _81;
    float _151 = 0.0;
    float _153 = _149;
    if (_131)
    {
        _151 = 0.5;
    }
    float _155 = _151;
    float _157 = 0.0;
    if (_131)
    {
        float _159 = 1.0 / _137;
        _157 = _159;
    }
    float _161 = _157;
    float _163 = _143;
    if (!_131)
    {
        float _165 = _115 * _143;
        float _167 = _165 * 0.5;
        _163 = _167;
    }
    float _169 = _163;
    float _171 = _67 * _105;
    float _173 = _171 + _121;
    float _175 = _169;
    if (_131)
    {
        float _177 = _149 * _161;
        _153 = _177;
    }
    float _179 = _153;
    if (_131)
    {
        float _181 = fma(_179, _155, 0.5);
        _175 = _181;
    }
    float _183 = _175;
    float2 _473 = float2(_183, _173);
    float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_473, float2(0.0), isnan(_473))).xyzw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _186.w;
    float _196 = in.m_42.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_42.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_44.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_46.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = _113 + _117;
    float _222 = _67 * _200;
    float _224 = _67 * _206;
    float _226 = _222 * _222;
    float _228 = fma(_224, _224, _226);
    float _230 = _67 * _212;
    float _232 = rsqrt(_228);
    bool _234 = _230 >= 0.0;
    bool _236 = isnan(_230);
    bool _238 = _234 || _236;
    bool _240 = isnan(0.0);
    bool _242 = _238 || _240;
    float _244 = _67 * _218;
    bool _246 = !_242;
    float _248 = _246 ? (-1.0) : 1.0;
    float _250 = _222 * _232;
    float _252 = _224 * _232;
    float _254 = _188 * _244;
    float _256 = _190 * _244;
    float _258 = _192 * _220;
    float _260 = _258 * 0.5;
    float _262 = -_194;
    float _264 = fma(_262, _244, -0.0);
    float _266 = _254 * _248;
    float _268 = _256 * _250;
    float _270 = _250 * _266;
    float _272 = fma(_252, _266, _268);
    float _274 = -_270;
    float _276 = fma(_256, _252, _274);
    out.m_32.x = _264;
    out.m_32.y = _260;
    out.m_32.z = _272;
    out.m_32.w = _276;
    return out;
}


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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_36 [[user(locn7)]];
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
    bool _75 = _69 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _77 = isnan(_69);
    bool _79 = _75 || _77;
    bool _81 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _83 = _79 || _81;
    bool _85 = _69 > (*spvDescriptorSet0.fp_c3)._m0[1].z;
    bool _87 = !_83;
    bool _89 = _85 || _87;
    bool _91 = false;
    if (!_89)
    {
        _91 = false;
    }
    bool _93 = _91;
    bool _95 = !_89;
    bool _97 = _93;
    if (!_95)
    {
        bool _99 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[1].y;
        bool _101 = isnan(_71);
        bool _103 = _99 || _101;
        bool _105 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].y);
        bool _107 = _103 || _105;
        bool _109 = _71 > (*spvDescriptorSet0.fp_c3)._m0[1].w;
        bool _111 = !_107;
        bool _113 = _109 || _111;
        _97 = _113;
    }
    bool _115 = _97;
    float _117 = _65;
    if (!_115)
    {
        float _119 = in.m_31.x;
        float _121 = gl_FragCoord.w;
        float _123 = _119 * _121;
        _117 = _123;
    }
    float _125 = _117;
    float _127 = _125;
    if (!_115)
    {
        float _129 = _67 * _125;
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _131 > (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _135 = _133 || _115;
    float _137 = _131;
    if (!_135)
    {
        float _139 = in.m_31.y;
        float _141 = gl_FragCoord.w;
        float _143 = _139 * _141;
        _137 = _143;
    }
    float _145 = _137;
    float _147 = _145;
    if (!_135)
    {
        float _149 = _67 * _145;
        _147 = _149;
    }
    float _151 = _147;
    bool _153 = _151 > (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _155 = _153 || _135;
    if (_155)
    {
        discard_fragment();
    }
    if (_155)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _157 = in.m_36.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_38.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_40.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _67 * _161;
    float _177 = _67 * _167;
    float _179 = _67 * _173;
    float _181 = _175 * 0.5;
    bool _183 = _177 >= _181;
    bool _185 = isnan(_177);
    bool _187 = _183 || _185;
    bool _189 = isnan(_181);
    bool _191 = _187 || _189;
    float _193 = 0.0;
    float _195 = _173;
    if (_191)
    {
        float _197 = _179 * 0.5;
        _193 = _197;
    }
    float _199 = _193;
    float _201 = 0.0;
    if (!_191)
    {
        float _203 = 1.0 / _181;
        _201 = _203;
    }
    float _205 = _201;
    if (_191)
    {
        float _207 = -_181;
        float _209 = _207 + _177;
        _195 = _209;
    }
    float _211 = _195;
    float _213 = 0.0;
    float _215 = _211;
    if (_191)
    {
        _213 = 0.5;
    }
    float _217 = _213;
    float _219 = 0.0;
    if (_191)
    {
        float _221 = 1.0 / _199;
        _219 = _221;
    }
    float _223 = _219;
    float _225 = _205;
    if (!_191)
    {
        float _227 = _177 * _205;
        float _229 = _227 * 0.5;
        _225 = _229;
    }
    float _231 = _225;
    float _233 = _69 + _71;
    float _235 = _231;
    if (_191)
    {
        float _237 = _211 * _223;
        _215 = _237;
    }
    float _239 = _215;
    if (_191)
    {
        float _241 = fma(_239, _217, 0.5);
        _235 = _241;
    }
    float _243 = _235;
    float2 _626 = float2(_243, _233);
    float4 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).xyzw;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _246.z;
    float _254 = _246.w;
    float _256 = in.m_42.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_42.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_44.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_46.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = _175 + _179;
    float _282 = _67 * _260;
    float _284 = _67 * _266;
    float _286 = _282 * _282;
    float _288 = fma(_284, _284, _286);
    float _290 = _67 * _272;
    float _292 = rsqrt(_288);
    bool _294 = _290 >= 0.0;
    bool _296 = isnan(_290);
    bool _298 = _294 || _296;
    bool _300 = isnan(0.0);
    bool _302 = _298 || _300;
    float _304 = _67 * _278;
    bool _306 = !_302;
    float _308 = _306 ? (-1.0) : 1.0;
    float _310 = _282 * _292;
    float _312 = _284 * _292;
    float _314 = _248 * _304;
    float _316 = _250 * _304;
    float _318 = _252 * _280;
    float _320 = _318 * 0.5;
    float _322 = -_254;
    float _324 = fma(_322, _304, -0.0);
    float _326 = _314 * _308;
    float _328 = _316 * _310;
    float _330 = _310 * _326;
    float _332 = fma(_312, _326, _328);
    float _334 = -_330;
    float _336 = fma(_316, _312, _334);
    out.m_34.x = _324;
    out.m_34.y = _320;
    out.m_34.z = _332;
    out.m_34.w = _336;
    return out;
}


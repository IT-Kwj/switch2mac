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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
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
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _41;
    float _63 = _61 * _47;
    float _65 = _61 * _53;
    float _67 = _61 * _59;
    float _69 = _63 * _63;
    float _71 = fma(_65, _65, _69);
    float _73 = fma(_67, _67, _71);
    float _75 = rsqrt(_73);
    float _77 = _63 * _75;
    float _79 = _65 * _75;
    float _81 = _67 * _75;
    float _83 = _77 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = _77 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _87 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _91 = fma(_85, 0.5, 0.5);
    float _93 = fma(_89, 0.5, 0.5);
    float2 _396 = float2(_93, _91);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _108 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[13].x, _106);
    float _110 = _104 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = fma(_112, _108, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _116 = _114 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _118 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _120 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].x, _118);
    float _122 = fma(_112, _120, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _124 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _126 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].x, _124);
    bool _130 = _116 >= 1.41299998760223388671875;
    bool _132 = isnan(_116);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.41299998760223388671875);
    bool _138 = _134 || _136;
    float _140 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _142 = fma(_112, _126, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _144 = _142 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _146 = _140 >= 1.41299998760223388671875;
    bool _148 = isnan(_140);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.41299998760223388671875);
    bool _154 = _150 || _152;
    bool _156 = _144 >= 1.41299998760223388671875;
    bool _158 = isnan(_144);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.41299998760223388671875);
    bool _164 = _160 || _162;
    int _167 = as_type<int>(_100);
    float _169 = _116;
    int _171 = as_type<int>(_102);
    float _173 = _112;
    float _175 = _140;
    float _177 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    int _179 = as_type<int>(_144);
    if (!_138)
    {
        float _181 = _116 * 0.38317000865936279296875;
        _167 = as_type<int>(_181);
    }
    int _183 = _167;
    if (_138)
    {
        float _185 = _116 * (-1.44269502162933349609375);
        _169 = _185;
    }
    float _187 = _169;
    float _189 = 0.0;
    float _191 = _187;
    if (_138)
    {
        float _193 = exp2(_187);
        _189 = _193;
    }
    float _195 = _189;
    if (!_154)
    {
        float _197 = _140 * 0.38317000865936279296875;
        _171 = as_type<int>(_197);
    }
    int _199 = _171;
    if (_154)
    {
        float _201 = _140 * (-1.44269502162933349609375);
        _173 = _201;
    }
    float _203 = _173;
    float _205 = 0.0;
    if (!_164)
    {
        float _207 = _144 * 0.38317000865936279296875;
        _205 = _207;
    }
    float _209 = _205;
    int _211 = _183;
    if (!_138)
    {
        float _213 = abs(as_type<float>(_183));
        float _215 = log2(_213);
        _211 = as_type<int>(_215);
    }
    int _217 = _211;
    float _219 = 0.0;
    if (_164)
    {
        float _221 = _144 * (-1.44269502162933349609375);
        _219 = _221;
    }
    float _223 = _219;
    int _225 = _199;
    if (!_154)
    {
        float _227 = abs(as_type<float>(_199));
        float _229 = log2(_227);
        _225 = as_type<int>(_229);
    }
    int _231 = _225;
    float _233 = _209;
    if (!_164)
    {
        float _235 = abs(_209);
        float _237 = log2(_235);
        _233 = _237;
    }
    float _239 = _233;
    int _241 = _217;
    if (!_138)
    {
        float _243 = as_type<float>(_217) * 0.4545454680919647216796875;
        _175 = _243;
    }
    float _245 = _175;
    int _247 = _231;
    if (!_154)
    {
        float _249 = as_type<float>(_231) * 0.4545454680919647216796875;
        _191 = _249;
    }
    float _251 = _191;
    float _253 = _203;
    if (_154)
    {
        float _255 = exp2(_203);
        _253 = _255;
    }
    float _257 = _253;
    if (!_164)
    {
        float _259 = _239 * 0.4545454680919647216796875;
        _177 = _259;
    }
    float _261 = _177;
    if (!_154)
    {
        float _263 = exp2(_251);
        _241 = as_type<int>(_263);
    }
    int _265 = _241;
    float _267 = _223;
    int _269 = _265;
    if (_164)
    {
        float _271 = exp2(_223);
        _267 = _271;
    }
    float _273 = _267;
    if (!_138)
    {
        float _275 = exp2(_245);
        _179 = as_type<int>(_275);
    }
    int _277 = _179;
    int _279 = _277;
    if (_154)
    {
        float _281 = -_257;
        float _283 = _281 + 1.0;
        _269 = as_type<int>(_283);
    }
    int _285 = _269;
    if (!_164)
    {
        float _287 = exp2(_261);
        _247 = as_type<int>(_287);
    }
    int _289 = _247;
    int _291 = _289;
    if (_138)
    {
        float _293 = -_195;
        float _295 = _293 + 1.0;
        _279 = as_type<int>(_295);
    }
    int _297 = _279;
    if (_164)
    {
        float _299 = -_273;
        float _301 = _299 + 1.0;
        _291 = as_type<int>(_301);
    }
    int _303 = _291;
    out.m_34.x = as_type<float>(_297);
    out.m_34.y = as_type<float>(_285);
    out.m_34.z = as_type<float>(_303);
    out.m_34.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _41;
    float _63 = _61 * _47;
    float _65 = _61 * _53;
    float _67 = _61 * _59;
    float _69 = _63 * _63;
    float _71 = fma(_65, _65, _69);
    float _73 = fma(_67, _67, _71);
    float _75 = rsqrt(_73);
    float _77 = _63 * _75;
    float _79 = _65 * _75;
    float _81 = _67 * _75;
    float _83 = _77 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = _77 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _87 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _91 = fma(_85, 0.5, 0.5);
    float _93 = fma(_89, 0.5, 0.5);
    float2 _396 = float2(_93, _91);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _108 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[13].x, _106);
    float _110 = _104 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = fma(_112, _108, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _116 = _114 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _118 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _120 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].x, _118);
    float _122 = fma(_112, _120, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _124 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _126 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].x, _124);
    bool _130 = _116 >= 1.41299998760223388671875;
    bool _132 = isnan(_116);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.41299998760223388671875);
    bool _138 = _134 || _136;
    float _140 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _142 = fma(_112, _126, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _144 = _142 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _146 = _140 >= 1.41299998760223388671875;
    bool _148 = isnan(_140);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.41299998760223388671875);
    bool _154 = _150 || _152;
    bool _156 = _144 >= 1.41299998760223388671875;
    bool _158 = isnan(_144);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.41299998760223388671875);
    bool _164 = _160 || _162;
    int _167 = as_type<int>(_100);
    float _169 = _116;
    int _171 = as_type<int>(_102);
    float _173 = _112;
    float _175 = _140;
    float _177 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    int _179 = as_type<int>(_144);
    if (!_138)
    {
        float _181 = _116 * 0.38317000865936279296875;
        _167 = as_type<int>(_181);
    }
    int _183 = _167;
    if (_138)
    {
        float _185 = _116 * (-1.44269502162933349609375);
        _169 = _185;
    }
    float _187 = _169;
    float _189 = 0.0;
    float _191 = _187;
    if (_138)
    {
        float _193 = exp2(_187);
        _189 = _193;
    }
    float _195 = _189;
    if (!_154)
    {
        float _197 = _140 * 0.38317000865936279296875;
        _171 = as_type<int>(_197);
    }
    int _199 = _171;
    if (_154)
    {
        float _201 = _140 * (-1.44269502162933349609375);
        _173 = _201;
    }
    float _203 = _173;
    float _205 = 0.0;
    if (!_164)
    {
        float _207 = _144 * 0.38317000865936279296875;
        _205 = _207;
    }
    float _209 = _205;
    int _211 = _183;
    if (!_138)
    {
        float _213 = abs(as_type<float>(_183));
        float _215 = log2(_213);
        _211 = as_type<int>(_215);
    }
    int _217 = _211;
    float _219 = 0.0;
    if (_164)
    {
        float _221 = _144 * (-1.44269502162933349609375);
        _219 = _221;
    }
    float _223 = _219;
    int _225 = _199;
    if (!_154)
    {
        float _227 = abs(as_type<float>(_199));
        float _229 = log2(_227);
        _225 = as_type<int>(_229);
    }
    int _231 = _225;
    float _233 = _209;
    if (!_164)
    {
        float _235 = abs(_209);
        float _237 = log2(_235);
        _233 = _237;
    }
    float _239 = _233;
    int _241 = _217;
    if (!_138)
    {
        float _243 = as_type<float>(_217) * 0.4545454680919647216796875;
        _175 = _243;
    }
    float _245 = _175;
    int _247 = _231;
    if (!_154)
    {
        float _249 = as_type<float>(_231) * 0.4545454680919647216796875;
        _191 = _249;
    }
    float _251 = _191;
    float _253 = _203;
    if (_154)
    {
        float _255 = exp2(_203);
        _253 = _255;
    }
    float _257 = _253;
    if (!_164)
    {
        float _259 = _239 * 0.4545454680919647216796875;
        _177 = _259;
    }
    float _261 = _177;
    if (!_154)
    {
        float _263 = exp2(_251);
        _241 = as_type<int>(_263);
    }
    int _265 = _241;
    float _267 = _223;
    int _269 = _265;
    if (_164)
    {
        float _271 = exp2(_223);
        _267 = _271;
    }
    float _273 = _267;
    if (!_138)
    {
        float _275 = exp2(_245);
        _179 = as_type<int>(_275);
    }
    int _277 = _179;
    int _279 = _277;
    if (_154)
    {
        float _281 = -_257;
        float _283 = _281 + 1.0;
        _269 = as_type<int>(_283);
    }
    int _285 = _269;
    if (!_164)
    {
        float _287 = exp2(_261);
        _247 = as_type<int>(_287);
    }
    int _289 = _247;
    int _291 = _289;
    if (_138)
    {
        float _293 = -_195;
        float _295 = _293 + 1.0;
        _279 = as_type<int>(_295);
    }
    int _297 = _279;
    if (_164)
    {
        float _299 = -_273;
        float _301 = _299 + 1.0;
        _291 = as_type<int>(_301);
    }
    int _303 = _291;
    out.m_34.x = as_type<float>(_297);
    out.m_34.y = as_type<float>(_285);
    out.m_34.z = as_type<float>(_303);
    out.m_34.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_34)};
}


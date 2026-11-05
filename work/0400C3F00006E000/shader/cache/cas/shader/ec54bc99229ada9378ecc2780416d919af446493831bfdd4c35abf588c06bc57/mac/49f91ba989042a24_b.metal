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
    float _89 = fma(_85, 0.5, 0.5);
    float _91 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _93 = fma(_91, -0.5, 0.5);
    float _95 = fma(_91, 0.5, 0.5);
    float _97 = fma(_95, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _99 = sqrt(_93);
    float _101 = fma(_95, _97, -0.212114393711090087890625);
    float _103 = fma(_95, _101, 1.570728778839111328125);
    float _105 = _99 * 0.636619746685028076171875;
    float _107 = -_103;
    float _109 = fma(_105, _107, 1.0);
    float2 _437 = float2(_109, _89);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_437, float2(0.0), isnan(_437))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _124 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[13].x, _122);
    float _126 = _120 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _132 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].x, _130);
    float _134 = fma(_128, _124, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _136 = fma(_128, _132, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _140 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _142 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].x, _140);
    float _144 = _136 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _146 = fma(_128, _142, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _150 = _138 >= 1.41299998760223388671875;
    bool _152 = isnan(_138);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.41299998760223388671875);
    bool _158 = _154 || _156;
    bool _160 = _144 >= 1.41299998760223388671875;
    bool _162 = isnan(_144);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.41299998760223388671875);
    bool _168 = _164 || _166;
    float _170 = _146 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _172 = _170 >= 1.41299998760223388671875;
    bool _174 = isnan(_170);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.41299998760223388671875);
    bool _180 = _176 || _178;
    int _183 = as_type<int>(_89);
    float _185 = _128;
    float _187 = _138;
    int _189 = as_type<int>(_114);
    float _191 = _116;
    float _193 = _144;
    float _195 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    int _197 = as_type<int>(_170);
    if (!_158)
    {
        float _199 = _138 * 0.38317000865936279296875;
        _183 = as_type<int>(_199);
    }
    int _201 = _183;
    if (_158)
    {
        float _203 = _138 * (-1.44269502162933349609375);
        _185 = _203;
    }
    float _205 = _185;
    float _207 = _205;
    if (!_168)
    {
        float _209 = _144 * 0.38317000865936279296875;
        _187 = _209;
    }
    float _211 = _187;
    float _213 = 0.0;
    if (_168)
    {
        float _215 = _144 * (-1.44269502162933349609375);
        _213 = _215;
    }
    float _217 = _213;
    float _219 = 0.0;
    if (_158)
    {
        float _221 = exp2(_205);
        _219 = _221;
    }
    float _223 = _219;
    if (!_180)
    {
        float _225 = _170 * 0.38317000865936279296875;
        _189 = as_type<int>(_225);
    }
    int _227 = _189;
    if (_180)
    {
        float _229 = _170 * (-1.44269502162933349609375);
        _191 = _229;
    }
    float _231 = _191;
    int _233 = _201;
    if (!_158)
    {
        float _235 = abs(as_type<float>(_201));
        float _237 = log2(_235);
        _233 = as_type<int>(_237);
    }
    int _239 = _233;
    int _241 = _227;
    if (!_180)
    {
        float _243 = abs(as_type<float>(_227));
        float _245 = log2(_243);
        _241 = as_type<int>(_245);
    }
    int _247 = _241;
    float _249 = _211;
    if (!_168)
    {
        float _251 = abs(_211);
        float _253 = log2(_251);
        _249 = _253;
    }
    float _255 = _249;
    int _257 = _239;
    if (!_158)
    {
        float _259 = as_type<float>(_239) * 0.4545454680919647216796875;
        _193 = _259;
    }
    float _261 = _193;
    int _263 = _247;
    if (!_180)
    {
        float _265 = as_type<float>(_247) * 0.4545454680919647216796875;
        _207 = _265;
    }
    float _267 = _207;
    float _269 = _231;
    if (_180)
    {
        float _271 = exp2(_231);
        _269 = _271;
    }
    float _273 = _269;
    if (!_168)
    {
        float _275 = _255 * 0.4545454680919647216796875;
        _195 = _275;
    }
    float _277 = _195;
    if (!_180)
    {
        float _279 = exp2(_267);
        _257 = as_type<int>(_279);
    }
    int _281 = _257;
    float _283 = _217;
    int _285 = _281;
    if (_168)
    {
        float _287 = exp2(_217);
        _283 = _287;
    }
    float _289 = _283;
    if (!_158)
    {
        float _291 = exp2(_261);
        _197 = as_type<int>(_291);
    }
    int _293 = _197;
    int _295 = _293;
    if (_180)
    {
        float _297 = -_273;
        float _299 = _297 + 1.0;
        _285 = as_type<int>(_299);
    }
    int _301 = _285;
    if (!_168)
    {
        float _303 = exp2(_277);
        _263 = as_type<int>(_303);
    }
    int _305 = _263;
    int _307 = _305;
    if (_158)
    {
        float _309 = -_223;
        float _311 = _309 + 1.0;
        _295 = as_type<int>(_311);
    }
    int _313 = _295;
    if (_168)
    {
        float _315 = -_289;
        float _317 = _315 + 1.0;
        _307 = as_type<int>(_317);
    }
    int _319 = _307;
    out.m_34.x = as_type<float>(_313);
    out.m_34.y = as_type<float>(_301);
    out.m_34.z = as_type<float>(_319);
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
    float _89 = fma(_85, 0.5, 0.5);
    float _91 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _93 = fma(_91, -0.5, 0.5);
    float _95 = fma(_91, 0.5, 0.5);
    float _97 = fma(_95, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _99 = sqrt(_93);
    float _101 = fma(_95, _97, -0.212114393711090087890625);
    float _103 = fma(_95, _101, 1.570728778839111328125);
    float _105 = _99 * 0.636619746685028076171875;
    float _107 = -_103;
    float _109 = fma(_105, _107, 1.0);
    float2 _437 = float2(_109, _89);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_437, float2(0.0), isnan(_437))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _124 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[13].x, _122);
    float _126 = _120 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _132 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].x, _130);
    float _134 = fma(_128, _124, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _136 = fma(_128, _132, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _140 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _142 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].x, _140);
    float _144 = _136 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _146 = fma(_128, _142, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _150 = _138 >= 1.41299998760223388671875;
    bool _152 = isnan(_138);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.41299998760223388671875);
    bool _158 = _154 || _156;
    bool _160 = _144 >= 1.41299998760223388671875;
    bool _162 = isnan(_144);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.41299998760223388671875);
    bool _168 = _164 || _166;
    float _170 = _146 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _172 = _170 >= 1.41299998760223388671875;
    bool _174 = isnan(_170);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.41299998760223388671875);
    bool _180 = _176 || _178;
    int _183 = as_type<int>(_89);
    float _185 = _128;
    float _187 = _138;
    int _189 = as_type<int>(_114);
    float _191 = _116;
    float _193 = _144;
    float _195 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    int _197 = as_type<int>(_170);
    if (!_158)
    {
        float _199 = _138 * 0.38317000865936279296875;
        _183 = as_type<int>(_199);
    }
    int _201 = _183;
    if (_158)
    {
        float _203 = _138 * (-1.44269502162933349609375);
        _185 = _203;
    }
    float _205 = _185;
    float _207 = _205;
    if (!_168)
    {
        float _209 = _144 * 0.38317000865936279296875;
        _187 = _209;
    }
    float _211 = _187;
    float _213 = 0.0;
    if (_168)
    {
        float _215 = _144 * (-1.44269502162933349609375);
        _213 = _215;
    }
    float _217 = _213;
    float _219 = 0.0;
    if (_158)
    {
        float _221 = exp2(_205);
        _219 = _221;
    }
    float _223 = _219;
    if (!_180)
    {
        float _225 = _170 * 0.38317000865936279296875;
        _189 = as_type<int>(_225);
    }
    int _227 = _189;
    if (_180)
    {
        float _229 = _170 * (-1.44269502162933349609375);
        _191 = _229;
    }
    float _231 = _191;
    int _233 = _201;
    if (!_158)
    {
        float _235 = abs(as_type<float>(_201));
        float _237 = log2(_235);
        _233 = as_type<int>(_237);
    }
    int _239 = _233;
    int _241 = _227;
    if (!_180)
    {
        float _243 = abs(as_type<float>(_227));
        float _245 = log2(_243);
        _241 = as_type<int>(_245);
    }
    int _247 = _241;
    float _249 = _211;
    if (!_168)
    {
        float _251 = abs(_211);
        float _253 = log2(_251);
        _249 = _253;
    }
    float _255 = _249;
    int _257 = _239;
    if (!_158)
    {
        float _259 = as_type<float>(_239) * 0.4545454680919647216796875;
        _193 = _259;
    }
    float _261 = _193;
    int _263 = _247;
    if (!_180)
    {
        float _265 = as_type<float>(_247) * 0.4545454680919647216796875;
        _207 = _265;
    }
    float _267 = _207;
    float _269 = _231;
    if (_180)
    {
        float _271 = exp2(_231);
        _269 = _271;
    }
    float _273 = _269;
    if (!_168)
    {
        float _275 = _255 * 0.4545454680919647216796875;
        _195 = _275;
    }
    float _277 = _195;
    if (!_180)
    {
        float _279 = exp2(_267);
        _257 = as_type<int>(_279);
    }
    int _281 = _257;
    float _283 = _217;
    int _285 = _281;
    if (_168)
    {
        float _287 = exp2(_217);
        _283 = _287;
    }
    float _289 = _283;
    if (!_158)
    {
        float _291 = exp2(_261);
        _197 = as_type<int>(_291);
    }
    int _293 = _197;
    int _295 = _293;
    if (_180)
    {
        float _297 = -_273;
        float _299 = _297 + 1.0;
        _285 = as_type<int>(_299);
    }
    int _301 = _285;
    if (!_168)
    {
        float _303 = exp2(_277);
        _263 = as_type<int>(_303);
    }
    int _305 = _263;
    int _307 = _305;
    if (_158)
    {
        float _309 = -_223;
        float _311 = _309 + 1.0;
        _295 = as_type<int>(_311);
    }
    int _313 = _295;
    if (_168)
    {
        float _315 = -_289;
        float _317 = _315 + 1.0;
        _307 = as_type<int>(_317);
    }
    int _319 = _307;
    out.m_34.x = as_type<float>(_313);
    out.m_34.y = as_type<float>(_301);
    out.m_34.z = as_type<float>(_319);
    out.m_34.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_34)};
}


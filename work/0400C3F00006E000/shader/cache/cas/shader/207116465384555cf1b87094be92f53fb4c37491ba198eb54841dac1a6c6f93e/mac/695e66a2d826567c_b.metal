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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _45;
    float _79 = _77 * _51;
    float _81 = _77 * _57;
    float _83 = _77 * _63;
    float _85 = _77 * _69;
    float _87 = _79 * _79;
    float _89 = fma(_81, _81, _87);
    float _91 = fma(_83, _83, _89);
    float _93 = rsqrt(_91);
    float _95 = _79 * _93;
    float _97 = _81 * _93;
    float _99 = _83 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _105 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _107 = fma(_103, 0.5, 0.5);
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _105);
    float _111 = _77 * _75;
    float _113 = fma(_109, -0.5, 0.5);
    float _115 = fma(_109, 0.5, 0.5);
    float _117 = fma(_115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _119 = sqrt(_113);
    float _121 = fma(_115, _117, -0.212114393711090087890625);
    float _123 = fma(_115, _121, 1.570728778839111328125);
    float _125 = _119 * 0.636619746685028076171875;
    float _127 = -_123;
    float _129 = fma(_125, _127, 1.0);
    float2 _499 = float2(_129, _107);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _518 = float2(_85, _111);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_518, float2(0.0), isnan(_518))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _154 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].x, _152);
    float _156 = _140 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _162 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
    float _164 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _166 = fma(_158, _162, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _168 = _164 * _150;
    float _170 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _172 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].x, _170);
    float _174 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[13].y, _168);
    float _176 = fma(_158, _172, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _178 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _180 = _176 * _150;
    float _182 = _166 * _150;
    float _184 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].y, _180);
    float _186 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[13].y, _182);
    bool _190 = _178 >= 1.41299998760223388671875;
    bool _192 = isnan(_178);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.41299998760223388671875);
    bool _198 = _194 || _196;
    float _200 = _184 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _202 = _186 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _204 = _200 >= 1.41299998760223388671875;
    bool _206 = isnan(_200);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.41299998760223388671875);
    bool _212 = _208 || _210;
    bool _214 = _202 >= 1.41299998760223388671875;
    bool _216 = isnan(_202);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.41299998760223388671875);
    bool _222 = _218 || _220;
    int _225 = as_type<int>(_136);
    float _227 = _178;
    int _229 = as_type<int>(_166);
    float _231 = _158;
    float _233 = _186;
    float _235 = _202;
    float _237 = _144;
    float _239 = _146;
    float _241 = _182;
    int _243 = as_type<int>(_200);
    if (!_198)
    {
        float _245 = _178 * 0.38317000865936279296875;
        _225 = as_type<int>(_245);
    }
    int _247 = _225;
    if (_198)
    {
        float _249 = _178 * (-1.44269502162933349609375);
        _227 = _249;
    }
    float _251 = _227;
    int _253 = _247;
    if (!_198)
    {
        float _255 = abs(as_type<float>(_247));
        float _257 = log2(_255);
        _253 = as_type<int>(_257);
    }
    int _259 = _253;
    if (!_212)
    {
        float _261 = _200 * 0.38317000865936279296875;
        _229 = as_type<int>(_261);
    }
    int _263 = _229;
    if (_212)
    {
        float _265 = _200 * (-1.44269502162933349609375);
        _231 = _265;
    }
    float _267 = _231;
    if (!_222)
    {
        float _269 = _202 * 0.38317000865936279296875;
        _233 = _269;
    }
    float _271 = _233;
    if (_222)
    {
        float _273 = _202 * (-1.44269502162933349609375);
        _235 = _273;
    }
    float _275 = _235;
    int _277 = _263;
    if (!_212)
    {
        float _279 = abs(as_type<float>(_263));
        float _281 = log2(_279);
        _277 = as_type<int>(_281);
    }
    int _283 = _277;
    float _285 = _271;
    if (!_222)
    {
        float _287 = abs(_271);
        float _289 = log2(_287);
        _285 = _289;
    }
    float _291 = _285;
    int _293 = _259;
    if (!_198)
    {
        float _295 = as_type<float>(_259) * 0.4545454680919647216796875;
        _237 = _295;
    }
    float _297 = _237;
    int _299 = _283;
    if (!_212)
    {
        float _301 = as_type<float>(_283) * 0.4545454680919647216796875;
        _239 = _301;
    }
    float _303 = _239;
    float _305 = _267;
    if (_212)
    {
        float _307 = exp2(_267);
        _305 = _307;
    }
    float _309 = _305;
    if (!_222)
    {
        float _311 = _291 * 0.4545454680919647216796875;
        _241 = _311;
    }
    float _313 = _241;
    if (!_212)
    {
        float _315 = exp2(_303);
        _293 = as_type<int>(_315);
    }
    int _317 = _293;
    float _319 = _251;
    int _321 = _317;
    if (_198)
    {
        float _323 = exp2(_251);
        _319 = _323;
    }
    float _325 = _319;
    float _327 = _275;
    if (_222)
    {
        float _329 = exp2(_275);
        _327 = _329;
    }
    float _331 = _327;
    if (_212)
    {
        float _333 = -_309;
        float _335 = _333 + 1.0;
        _321 = as_type<int>(_335);
    }
    int _337 = _321;
    if (!_198)
    {
        float _339 = exp2(_297);
        _243 = as_type<int>(_339);
    }
    int _341 = _243;
    int _343 = _341;
    if (!_222)
    {
        float _345 = exp2(_313);
        _299 = as_type<int>(_345);
    }
    int _347 = _299;
    int _349 = _347;
    if (_198)
    {
        float _351 = -_325;
        float _353 = _351 + 1.0;
        _343 = as_type<int>(_353);
    }
    int _355 = _343;
    if (_222)
    {
        float _357 = -_331;
        float _359 = _357 + 1.0;
        _349 = as_type<int>(_359);
    }
    int _361 = _349;
    out.m_38.x = as_type<float>(_355);
    out.m_38.y = as_type<float>(_337);
    out.m_38.z = as_type<float>(_361);
    out.m_38.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _45;
    float _79 = _77 * _51;
    float _81 = _77 * _57;
    float _83 = _77 * _63;
    float _85 = _77 * _69;
    float _87 = _79 * _79;
    float _89 = fma(_81, _81, _87);
    float _91 = fma(_83, _83, _89);
    float _93 = rsqrt(_91);
    float _95 = _79 * _93;
    float _97 = _81 * _93;
    float _99 = _83 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _105 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _107 = fma(_103, 0.5, 0.5);
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _105);
    float _111 = _77 * _75;
    float _113 = fma(_109, -0.5, 0.5);
    float _115 = fma(_109, 0.5, 0.5);
    float _117 = fma(_115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _119 = sqrt(_113);
    float _121 = fma(_115, _117, -0.212114393711090087890625);
    float _123 = fma(_115, _121, 1.570728778839111328125);
    float _125 = _119 * 0.636619746685028076171875;
    float _127 = -_123;
    float _129 = fma(_125, _127, 1.0);
    float2 _499 = float2(_129, _107);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _518 = float2(_85, _111);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_518, float2(0.0), isnan(_518))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _154 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].x, _152);
    float _156 = _140 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _162 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
    float _164 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _166 = fma(_158, _162, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _168 = _164 * _150;
    float _170 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _172 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].x, _170);
    float _174 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[13].y, _168);
    float _176 = fma(_158, _172, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _178 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _180 = _176 * _150;
    float _182 = _166 * _150;
    float _184 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].y, _180);
    float _186 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[13].y, _182);
    bool _190 = _178 >= 1.41299998760223388671875;
    bool _192 = isnan(_178);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.41299998760223388671875);
    bool _198 = _194 || _196;
    float _200 = _184 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _202 = _186 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _204 = _200 >= 1.41299998760223388671875;
    bool _206 = isnan(_200);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.41299998760223388671875);
    bool _212 = _208 || _210;
    bool _214 = _202 >= 1.41299998760223388671875;
    bool _216 = isnan(_202);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.41299998760223388671875);
    bool _222 = _218 || _220;
    int _225 = as_type<int>(_136);
    float _227 = _178;
    int _229 = as_type<int>(_166);
    float _231 = _158;
    float _233 = _186;
    float _235 = _202;
    float _237 = _144;
    float _239 = _146;
    float _241 = _182;
    int _243 = as_type<int>(_200);
    if (!_198)
    {
        float _245 = _178 * 0.38317000865936279296875;
        _225 = as_type<int>(_245);
    }
    int _247 = _225;
    if (_198)
    {
        float _249 = _178 * (-1.44269502162933349609375);
        _227 = _249;
    }
    float _251 = _227;
    int _253 = _247;
    if (!_198)
    {
        float _255 = abs(as_type<float>(_247));
        float _257 = log2(_255);
        _253 = as_type<int>(_257);
    }
    int _259 = _253;
    if (!_212)
    {
        float _261 = _200 * 0.38317000865936279296875;
        _229 = as_type<int>(_261);
    }
    int _263 = _229;
    if (_212)
    {
        float _265 = _200 * (-1.44269502162933349609375);
        _231 = _265;
    }
    float _267 = _231;
    if (!_222)
    {
        float _269 = _202 * 0.38317000865936279296875;
        _233 = _269;
    }
    float _271 = _233;
    if (_222)
    {
        float _273 = _202 * (-1.44269502162933349609375);
        _235 = _273;
    }
    float _275 = _235;
    int _277 = _263;
    if (!_212)
    {
        float _279 = abs(as_type<float>(_263));
        float _281 = log2(_279);
        _277 = as_type<int>(_281);
    }
    int _283 = _277;
    float _285 = _271;
    if (!_222)
    {
        float _287 = abs(_271);
        float _289 = log2(_287);
        _285 = _289;
    }
    float _291 = _285;
    int _293 = _259;
    if (!_198)
    {
        float _295 = as_type<float>(_259) * 0.4545454680919647216796875;
        _237 = _295;
    }
    float _297 = _237;
    int _299 = _283;
    if (!_212)
    {
        float _301 = as_type<float>(_283) * 0.4545454680919647216796875;
        _239 = _301;
    }
    float _303 = _239;
    float _305 = _267;
    if (_212)
    {
        float _307 = exp2(_267);
        _305 = _307;
    }
    float _309 = _305;
    if (!_222)
    {
        float _311 = _291 * 0.4545454680919647216796875;
        _241 = _311;
    }
    float _313 = _241;
    if (!_212)
    {
        float _315 = exp2(_303);
        _293 = as_type<int>(_315);
    }
    int _317 = _293;
    float _319 = _251;
    int _321 = _317;
    if (_198)
    {
        float _323 = exp2(_251);
        _319 = _323;
    }
    float _325 = _319;
    float _327 = _275;
    if (_222)
    {
        float _329 = exp2(_275);
        _327 = _329;
    }
    float _331 = _327;
    if (_212)
    {
        float _333 = -_309;
        float _335 = _333 + 1.0;
        _321 = as_type<int>(_335);
    }
    int _337 = _321;
    if (!_198)
    {
        float _339 = exp2(_297);
        _243 = as_type<int>(_339);
    }
    int _341 = _243;
    int _343 = _341;
    if (!_222)
    {
        float _345 = exp2(_313);
        _299 = as_type<int>(_345);
    }
    int _347 = _299;
    int _349 = _347;
    if (_198)
    {
        float _351 = -_325;
        float _353 = _351 + 1.0;
        _343 = as_type<int>(_353);
    }
    int _355 = _343;
    if (_222)
    {
        float _357 = -_331;
        float _359 = _357 + 1.0;
        _349 = as_type<int>(_359);
    }
    int _361 = _349;
    out.m_38.x = as_type<float>(_355);
    out.m_38.y = as_type<float>(_337);
    out.m_38.z = as_type<float>(_361);
    out.m_38.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_38)};
}


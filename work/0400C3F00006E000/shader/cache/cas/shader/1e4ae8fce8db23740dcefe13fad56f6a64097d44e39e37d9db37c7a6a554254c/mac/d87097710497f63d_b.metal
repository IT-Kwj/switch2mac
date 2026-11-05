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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _47;
    float _81 = _79 * _53;
    float _83 = _79 * _59;
    float _85 = _79 * _65;
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _81 * _93;
    float _97 = _83 * _93;
    float _99 = _85 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _105 = _79 * _77;
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _107);
    float _111 = fma(_103, 0.5, 0.5);
    float _113 = fma(_109, 0.5, 0.5);
    float _115 = _79 * _71;
    float2 _506 = float2(_113, _111);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float2 _525 = float2(_115, _105);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_525, float2(0.0), isnan(_525))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = 0.0 + _103;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = in.m_37.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = abs(_140);
    float _150 = log2(_148);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _156 = _150 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _158 = exp2(_156);
    float _160 = _79 * _146;
    float _162 = fma(_158, _154, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _164 = _162 * _160;
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _168 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
    float _170 = _126 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _176 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
    float _178 = fma(_172, _168, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _180 = fma(_172, _176, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _182 = _178 * _136;
    float _184 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[13].y, _182);
    float _186 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _188 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _190 = -_184;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _194 = fma(_172, _188, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _196 = fma(_164, _192, _184);
    float _198 = _194 * _136;
    float _200 = _180 * _136;
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _204 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].y, _198);
    float _206 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].y, _200);
    float _208 = -_204;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _212 = -_206;
    float _214 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    bool _218 = _202 >= 1.41299998760223388671875;
    bool _220 = isnan(_202);
    bool _222 = _218 || _220;
    bool _224 = isnan(1.41299998760223388671875);
    bool _226 = _222 || _224;
    float _228 = fma(_164, _210, _204);
    float _230 = fma(_164, _214, _206);
    float _232 = _228 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _236 = _232 >= 1.41299998760223388671875;
    bool _238 = isnan(_232);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    bool _246 = _234 >= 1.41299998760223388671875;
    bool _248 = isnan(_234);
    bool _250 = _246 || _248;
    bool _252 = isnan(1.41299998760223388671875);
    bool _254 = _250 || _252;
    int _257 = as_type<int>(_206);
    float _259 = _172;
    float _261 = _184;
    int _263 = as_type<int>(_204);
    float _265 = _232;
    float _267 = _202;
    float _269 = _160;
    float _271 = _180;
    float _273 = _122;
    int _275 = as_type<int>(_234);
    if (!_226)
    {
        float _277 = _202 * 0.38317000865936279296875;
        _257 = as_type<int>(_277);
    }
    int _279 = _257;
    if (_226)
    {
        float _281 = _202 * (-1.44269502162933349609375);
        _259 = _281;
    }
    float _283 = _259;
    float _285 = _283;
    if (_226)
    {
        float _287 = exp2(_283);
        _261 = _287;
    }
    float _289 = _261;
    if (!_244)
    {
        float _291 = _232 * 0.38317000865936279296875;
        _263 = as_type<int>(_291);
    }
    int _293 = _263;
    if (_244)
    {
        float _295 = _232 * (-1.44269502162933349609375);
        _265 = _295;
    }
    float _297 = _265;
    if (!_254)
    {
        float _299 = _234 * 0.38317000865936279296875;
        _267 = _299;
    }
    float _301 = _267;
    int _303 = _279;
    if (!_226)
    {
        float _305 = abs(as_type<float>(_279));
        float _307 = log2(_305);
        _303 = as_type<int>(_307);
    }
    int _309 = _303;
    if (_254)
    {
        float _311 = _234 * (-1.44269502162933349609375);
        _269 = _311;
    }
    float _313 = _269;
    int _315 = _293;
    if (!_244)
    {
        float _317 = abs(as_type<float>(_293));
        float _319 = log2(_317);
        _315 = as_type<int>(_319);
    }
    int _321 = _315;
    float _323 = _301;
    if (!_254)
    {
        float _325 = abs(_301);
        float _327 = log2(_325);
        _323 = _327;
    }
    float _329 = _323;
    int _331 = _309;
    if (!_226)
    {
        float _333 = as_type<float>(_309) * 0.4545454680919647216796875;
        _271 = _333;
    }
    float _335 = _271;
    int _337 = _321;
    if (!_244)
    {
        float _339 = as_type<float>(_321) * 0.4545454680919647216796875;
        _285 = _339;
    }
    float _341 = _285;
    float _343 = _297;
    if (_244)
    {
        float _345 = exp2(_297);
        _343 = _345;
    }
    float _347 = _343;
    if (!_254)
    {
        float _349 = _329 * 0.4545454680919647216796875;
        _273 = _349;
    }
    float _351 = _273;
    if (!_244)
    {
        float _353 = exp2(_341);
        _275 = as_type<int>(_353);
    }
    int _355 = _275;
    float _357 = _313;
    int _359 = _355;
    if (_254)
    {
        float _361 = exp2(_313);
        _357 = _361;
    }
    float _363 = _357;
    if (!_226)
    {
        float _365 = exp2(_335);
        _331 = as_type<int>(_365);
    }
    int _367 = _331;
    int _369 = _367;
    if (_244)
    {
        float _371 = -_347;
        float _373 = _371 + 1.0;
        _359 = as_type<int>(_373);
    }
    int _375 = _359;
    if (!_254)
    {
        float _377 = exp2(_351);
        _337 = as_type<int>(_377);
    }
    int _379 = _337;
    int _381 = _379;
    if (_226)
    {
        float _383 = -_289;
        float _385 = _383 + 1.0;
        _369 = as_type<int>(_385);
    }
    int _387 = _369;
    if (_254)
    {
        float _389 = -_363;
        float _391 = _389 + 1.0;
        _381 = as_type<int>(_391);
    }
    int _393 = _381;
    out.m_40.x = as_type<float>(_387);
    out.m_40.y = as_type<float>(_375);
    out.m_40.z = as_type<float>(_393);
    out.m_40.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _47;
    float _81 = _79 * _53;
    float _83 = _79 * _59;
    float _85 = _79 * _65;
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _81 * _93;
    float _97 = _83 * _93;
    float _99 = _85 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _105 = _79 * _77;
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _107);
    float _111 = fma(_103, 0.5, 0.5);
    float _113 = fma(_109, 0.5, 0.5);
    float _115 = _79 * _71;
    float2 _506 = float2(_113, _111);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float2 _525 = float2(_115, _105);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_525, float2(0.0), isnan(_525))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = 0.0 + _103;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = in.m_37.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = abs(_140);
    float _150 = log2(_148);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _156 = _150 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _158 = exp2(_156);
    float _160 = _79 * _146;
    float _162 = fma(_158, _154, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _164 = _162 * _160;
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _168 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
    float _170 = _126 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _176 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
    float _178 = fma(_172, _168, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _180 = fma(_172, _176, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _182 = _178 * _136;
    float _184 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[13].y, _182);
    float _186 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _188 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _190 = -_184;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _194 = fma(_172, _188, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _196 = fma(_164, _192, _184);
    float _198 = _194 * _136;
    float _200 = _180 * _136;
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _204 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].y, _198);
    float _206 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].y, _200);
    float _208 = -_204;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _212 = -_206;
    float _214 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    bool _218 = _202 >= 1.41299998760223388671875;
    bool _220 = isnan(_202);
    bool _222 = _218 || _220;
    bool _224 = isnan(1.41299998760223388671875);
    bool _226 = _222 || _224;
    float _228 = fma(_164, _210, _204);
    float _230 = fma(_164, _214, _206);
    float _232 = _228 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _236 = _232 >= 1.41299998760223388671875;
    bool _238 = isnan(_232);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    bool _246 = _234 >= 1.41299998760223388671875;
    bool _248 = isnan(_234);
    bool _250 = _246 || _248;
    bool _252 = isnan(1.41299998760223388671875);
    bool _254 = _250 || _252;
    int _257 = as_type<int>(_206);
    float _259 = _172;
    float _261 = _184;
    int _263 = as_type<int>(_204);
    float _265 = _232;
    float _267 = _202;
    float _269 = _160;
    float _271 = _180;
    float _273 = _122;
    int _275 = as_type<int>(_234);
    if (!_226)
    {
        float _277 = _202 * 0.38317000865936279296875;
        _257 = as_type<int>(_277);
    }
    int _279 = _257;
    if (_226)
    {
        float _281 = _202 * (-1.44269502162933349609375);
        _259 = _281;
    }
    float _283 = _259;
    float _285 = _283;
    if (_226)
    {
        float _287 = exp2(_283);
        _261 = _287;
    }
    float _289 = _261;
    if (!_244)
    {
        float _291 = _232 * 0.38317000865936279296875;
        _263 = as_type<int>(_291);
    }
    int _293 = _263;
    if (_244)
    {
        float _295 = _232 * (-1.44269502162933349609375);
        _265 = _295;
    }
    float _297 = _265;
    if (!_254)
    {
        float _299 = _234 * 0.38317000865936279296875;
        _267 = _299;
    }
    float _301 = _267;
    int _303 = _279;
    if (!_226)
    {
        float _305 = abs(as_type<float>(_279));
        float _307 = log2(_305);
        _303 = as_type<int>(_307);
    }
    int _309 = _303;
    if (_254)
    {
        float _311 = _234 * (-1.44269502162933349609375);
        _269 = _311;
    }
    float _313 = _269;
    int _315 = _293;
    if (!_244)
    {
        float _317 = abs(as_type<float>(_293));
        float _319 = log2(_317);
        _315 = as_type<int>(_319);
    }
    int _321 = _315;
    float _323 = _301;
    if (!_254)
    {
        float _325 = abs(_301);
        float _327 = log2(_325);
        _323 = _327;
    }
    float _329 = _323;
    int _331 = _309;
    if (!_226)
    {
        float _333 = as_type<float>(_309) * 0.4545454680919647216796875;
        _271 = _333;
    }
    float _335 = _271;
    int _337 = _321;
    if (!_244)
    {
        float _339 = as_type<float>(_321) * 0.4545454680919647216796875;
        _285 = _339;
    }
    float _341 = _285;
    float _343 = _297;
    if (_244)
    {
        float _345 = exp2(_297);
        _343 = _345;
    }
    float _347 = _343;
    if (!_254)
    {
        float _349 = _329 * 0.4545454680919647216796875;
        _273 = _349;
    }
    float _351 = _273;
    if (!_244)
    {
        float _353 = exp2(_341);
        _275 = as_type<int>(_353);
    }
    int _355 = _275;
    float _357 = _313;
    int _359 = _355;
    if (_254)
    {
        float _361 = exp2(_313);
        _357 = _361;
    }
    float _363 = _357;
    if (!_226)
    {
        float _365 = exp2(_335);
        _331 = as_type<int>(_365);
    }
    int _367 = _331;
    int _369 = _367;
    if (_244)
    {
        float _371 = -_347;
        float _373 = _371 + 1.0;
        _359 = as_type<int>(_373);
    }
    int _375 = _359;
    if (!_254)
    {
        float _377 = exp2(_351);
        _337 = as_type<int>(_377);
    }
    int _379 = _337;
    int _381 = _379;
    if (_226)
    {
        float _383 = -_289;
        float _385 = _383 + 1.0;
        _369 = as_type<int>(_385);
    }
    int _387 = _369;
    if (_254)
    {
        float _389 = -_363;
        float _391 = _389 + 1.0;
        _381 = as_type<int>(_391);
    }
    int _393 = _381;
    out.m_40.x = as_type<float>(_387);
    out.m_40.y = as_type<float>(_375);
    out.m_40.z = as_type<float>(_393);
    out.m_40.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_40)};
}


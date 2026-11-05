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
    float _107 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _105);
    float _109 = _77 * _75;
    float _111 = fma(_103, 0.5, 0.5);
    float _113 = fma(_107, 0.5, 0.5);
    float2 _458 = float2(_113, _111);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float2 _477 = float2(_85, _109);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_477, float2(0.0), isnan(_477))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].x, _136);
    float _140 = _124 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _146 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[13].x, _144);
    float _148 = fma(_142, _138, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _150 = fma(_142, _146, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _152 = _148 * _134;
    float _154 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _156 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _154);
    float _158 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[13].y, _152);
    float _160 = fma(_142, _156, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _162 = _158 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _164 = _160 * _134;
    float _166 = _150 * _134;
    float _168 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[13].y, _164);
    float _170 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].y, _166);
    bool _174 = _162 >= 1.41299998760223388671875;
    bool _176 = isnan(_162);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.41299998760223388671875);
    bool _182 = _178 || _180;
    float _184 = _168 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _186 = _170 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _188 = _184 >= 1.41299998760223388671875;
    bool _190 = isnan(_184);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.41299998760223388671875);
    bool _196 = _192 || _194;
    bool _198 = _186 >= 1.41299998760223388671875;
    bool _200 = isnan(_186);
    bool _202 = _198 || _200;
    bool _204 = isnan(1.41299998760223388671875);
    bool _206 = _202 || _204;
    int _209 = as_type<int>(_120);
    float _211 = _162;
    int _213 = as_type<int>(_150);
    float _215 = _142;
    float _217 = _170;
    float _219 = _186;
    float _221 = _128;
    float _223 = _130;
    float _225 = _166;
    int _227 = as_type<int>(_184);
    if (!_182)
    {
        float _229 = _162 * 0.38317000865936279296875;
        _209 = as_type<int>(_229);
    }
    int _231 = _209;
    if (_182)
    {
        float _233 = _162 * (-1.44269502162933349609375);
        _211 = _233;
    }
    float _235 = _211;
    int _237 = _231;
    if (!_182)
    {
        float _239 = abs(as_type<float>(_231));
        float _241 = log2(_239);
        _237 = as_type<int>(_241);
    }
    int _243 = _237;
    if (!_196)
    {
        float _245 = _184 * 0.38317000865936279296875;
        _213 = as_type<int>(_245);
    }
    int _247 = _213;
    if (_196)
    {
        float _249 = _184 * (-1.44269502162933349609375);
        _215 = _249;
    }
    float _251 = _215;
    if (!_206)
    {
        float _253 = _186 * 0.38317000865936279296875;
        _217 = _253;
    }
    float _255 = _217;
    if (_206)
    {
        float _257 = _186 * (-1.44269502162933349609375);
        _219 = _257;
    }
    float _259 = _219;
    int _261 = _247;
    if (!_196)
    {
        float _263 = abs(as_type<float>(_247));
        float _265 = log2(_263);
        _261 = as_type<int>(_265);
    }
    int _267 = _261;
    float _269 = _255;
    if (!_206)
    {
        float _271 = abs(_255);
        float _273 = log2(_271);
        _269 = _273;
    }
    float _275 = _269;
    int _277 = _243;
    if (!_182)
    {
        float _279 = as_type<float>(_243) * 0.4545454680919647216796875;
        _221 = _279;
    }
    float _281 = _221;
    int _283 = _267;
    if (!_196)
    {
        float _285 = as_type<float>(_267) * 0.4545454680919647216796875;
        _223 = _285;
    }
    float _287 = _223;
    float _289 = _251;
    if (_196)
    {
        float _291 = exp2(_251);
        _289 = _291;
    }
    float _293 = _289;
    if (!_206)
    {
        float _295 = _275 * 0.4545454680919647216796875;
        _225 = _295;
    }
    float _297 = _225;
    if (!_196)
    {
        float _299 = exp2(_287);
        _277 = as_type<int>(_299);
    }
    int _301 = _277;
    float _303 = _235;
    int _305 = _301;
    if (_182)
    {
        float _307 = exp2(_235);
        _303 = _307;
    }
    float _309 = _303;
    float _311 = _259;
    if (_206)
    {
        float _313 = exp2(_259);
        _311 = _313;
    }
    float _315 = _311;
    if (_196)
    {
        float _317 = -_293;
        float _319 = _317 + 1.0;
        _305 = as_type<int>(_319);
    }
    int _321 = _305;
    if (!_182)
    {
        float _323 = exp2(_281);
        _227 = as_type<int>(_323);
    }
    int _325 = _227;
    int _327 = _325;
    if (!_206)
    {
        float _329 = exp2(_297);
        _283 = as_type<int>(_329);
    }
    int _331 = _283;
    int _333 = _331;
    if (_182)
    {
        float _335 = -_309;
        float _337 = _335 + 1.0;
        _327 = as_type<int>(_337);
    }
    int _339 = _327;
    if (_206)
    {
        float _341 = -_315;
        float _343 = _341 + 1.0;
        _333 = as_type<int>(_343);
    }
    int _345 = _333;
    out.m_38.x = as_type<float>(_339);
    out.m_38.y = as_type<float>(_321);
    out.m_38.z = as_type<float>(_345);
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
    float _107 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _105);
    float _109 = _77 * _75;
    float _111 = fma(_103, 0.5, 0.5);
    float _113 = fma(_107, 0.5, 0.5);
    float2 _458 = float2(_113, _111);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float2 _477 = float2(_85, _109);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_477, float2(0.0), isnan(_477))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].x, _136);
    float _140 = _124 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _146 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[13].x, _144);
    float _148 = fma(_142, _138, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _150 = fma(_142, _146, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _152 = _148 * _134;
    float _154 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _156 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _154);
    float _158 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[13].y, _152);
    float _160 = fma(_142, _156, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _162 = _158 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _164 = _160 * _134;
    float _166 = _150 * _134;
    float _168 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[13].y, _164);
    float _170 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].y, _166);
    bool _174 = _162 >= 1.41299998760223388671875;
    bool _176 = isnan(_162);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.41299998760223388671875);
    bool _182 = _178 || _180;
    float _184 = _168 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _186 = _170 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _188 = _184 >= 1.41299998760223388671875;
    bool _190 = isnan(_184);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.41299998760223388671875);
    bool _196 = _192 || _194;
    bool _198 = _186 >= 1.41299998760223388671875;
    bool _200 = isnan(_186);
    bool _202 = _198 || _200;
    bool _204 = isnan(1.41299998760223388671875);
    bool _206 = _202 || _204;
    int _209 = as_type<int>(_120);
    float _211 = _162;
    int _213 = as_type<int>(_150);
    float _215 = _142;
    float _217 = _170;
    float _219 = _186;
    float _221 = _128;
    float _223 = _130;
    float _225 = _166;
    int _227 = as_type<int>(_184);
    if (!_182)
    {
        float _229 = _162 * 0.38317000865936279296875;
        _209 = as_type<int>(_229);
    }
    int _231 = _209;
    if (_182)
    {
        float _233 = _162 * (-1.44269502162933349609375);
        _211 = _233;
    }
    float _235 = _211;
    int _237 = _231;
    if (!_182)
    {
        float _239 = abs(as_type<float>(_231));
        float _241 = log2(_239);
        _237 = as_type<int>(_241);
    }
    int _243 = _237;
    if (!_196)
    {
        float _245 = _184 * 0.38317000865936279296875;
        _213 = as_type<int>(_245);
    }
    int _247 = _213;
    if (_196)
    {
        float _249 = _184 * (-1.44269502162933349609375);
        _215 = _249;
    }
    float _251 = _215;
    if (!_206)
    {
        float _253 = _186 * 0.38317000865936279296875;
        _217 = _253;
    }
    float _255 = _217;
    if (_206)
    {
        float _257 = _186 * (-1.44269502162933349609375);
        _219 = _257;
    }
    float _259 = _219;
    int _261 = _247;
    if (!_196)
    {
        float _263 = abs(as_type<float>(_247));
        float _265 = log2(_263);
        _261 = as_type<int>(_265);
    }
    int _267 = _261;
    float _269 = _255;
    if (!_206)
    {
        float _271 = abs(_255);
        float _273 = log2(_271);
        _269 = _273;
    }
    float _275 = _269;
    int _277 = _243;
    if (!_182)
    {
        float _279 = as_type<float>(_243) * 0.4545454680919647216796875;
        _221 = _279;
    }
    float _281 = _221;
    int _283 = _267;
    if (!_196)
    {
        float _285 = as_type<float>(_267) * 0.4545454680919647216796875;
        _223 = _285;
    }
    float _287 = _223;
    float _289 = _251;
    if (_196)
    {
        float _291 = exp2(_251);
        _289 = _291;
    }
    float _293 = _289;
    if (!_206)
    {
        float _295 = _275 * 0.4545454680919647216796875;
        _225 = _295;
    }
    float _297 = _225;
    if (!_196)
    {
        float _299 = exp2(_287);
        _277 = as_type<int>(_299);
    }
    int _301 = _277;
    float _303 = _235;
    int _305 = _301;
    if (_182)
    {
        float _307 = exp2(_235);
        _303 = _307;
    }
    float _309 = _303;
    float _311 = _259;
    if (_206)
    {
        float _313 = exp2(_259);
        _311 = _313;
    }
    float _315 = _311;
    if (_196)
    {
        float _317 = -_293;
        float _319 = _317 + 1.0;
        _305 = as_type<int>(_319);
    }
    int _321 = _305;
    if (!_182)
    {
        float _323 = exp2(_281);
        _227 = as_type<int>(_323);
    }
    int _325 = _227;
    int _327 = _325;
    if (!_206)
    {
        float _329 = exp2(_297);
        _283 = as_type<int>(_329);
    }
    int _331 = _283;
    int _333 = _331;
    if (_182)
    {
        float _335 = -_309;
        float _337 = _335 + 1.0;
        _327 = as_type<int>(_337);
    }
    int _339 = _327;
    if (_206)
    {
        float _341 = -_315;
        float _343 = _341 + 1.0;
        _333 = as_type<int>(_343);
    }
    int _345 = _333;
    out.m_38.x = as_type<float>(_339);
    out.m_38.y = as_type<float>(_321);
    out.m_38.z = as_type<float>(_345);
    out.m_38.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_38)};
}


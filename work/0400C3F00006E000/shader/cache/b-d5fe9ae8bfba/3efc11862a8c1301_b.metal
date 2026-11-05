#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c1 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_27 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _751 = false;
    bool _166 = false;
    bool _313 = false;
    bool _311 = false;
    bool _307 = false;
    bool _303 = false;
    bool _299 = false;
    bool _295 = false;
    bool _291 = false;
    bool _287 = false;
    bool _283 = false;
    bool _279 = false;
    bool _275 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_24.x;
    float _47 = in.m_24.y;
    float _49 = -_47;
    float _51 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _53 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _97;
    out.gl_Position.y = _99;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _101;
    float _116 = _89;
    float _118 = _67;
    float _120 = _91;
    float _122 = _97;
    float _124 = _99;
    float _126 = _101;
    float _128 = _103;
    float _130 = _53;
    float _132 = _51;
    bool _138;
    float _144;
    float _148;
    float _152;
    float _156;
    float _160;
    float _164;
    if (!_112)
    {
        int _134 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _136 = _134 != 0;
        _138 = _136;
        if (_136)
        {
            _114 = _45;
        }
        float _140 = _114;
        float _142 = _140;
        _144 = _140;
        if (_136)
        {
            _116 = _47;
        }
        float _146 = _116;
        _148 = _146;
        if (_136)
        {
            _118 = 255.0;
        }
        float _150 = _118;
        _152 = _150;
        if (_136)
        {
            _120 = 255.0;
        }
        float _154 = _120;
        _156 = _154;
        if (_136)
        {
            _122 = 255.0;
        }
        float _158 = _122;
        _160 = _158;
        if (_136)
        {
            _124 = 255.0;
        }
        float _162 = _124;
        _164 = _162;
        _166 = _136;
        if (!_166)
        {
            float _168 = trunc(_45);
            int _170 = int(_168);
            float _172 = trunc(_47);
            int _174 = int(_172);
            int _176 = _174 << 1;
            int _178 = _176 + _170;
            int _180 = _178 << 4;
            bool _182 = _180 == 0;
            bool _184 = _180 == 16;
            bool _186 = _180 == 32;
            bool _188 = _180 == 48;
            float _190 = as_type<float>(_180);
            _152 = 255.0;
            _156 = 255.0;
            _160 = 255.0;
            _164 = 255.0;
            if (_182)
            {
                _142 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _192 = _142;
            float _194 = _192;
            if (_182)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _196 = _190;
            float _198 = _196;
            if (_184)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _200 = _194;
            float _202 = _200;
            if (_184)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _204 = _198;
            float _206 = _204;
            if (_186)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _208 = _202;
            float _210 = _208;
            if (_186)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _212 = _206;
            float _214 = _212;
            if (_188)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _216 = _210;
            _144 = _216;
            if (_188)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _218 = _214;
            _148 = _218;
            _166 = true;
        }
    }
    else
    {
        int _220 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _222 = _220 != 0;
        uint _225 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _227 = int(_225) & 15;
        bool _229 = !_222;
        float _231 = as_type<float>(_227);
        _138 = _222;
        if (!_229)
        {
            uint _233 = min(uint(_227), 13u);
            float _235 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _237 = int(_233) << 2;
            uint _239 = uint(int(uint(_237) >> uint(2)));
            uint _241 = uint(int(uint(int(_239)) >> uint(2)));
            int _243 = int(_239) & 3;
            float _245 = (*spvDescriptorSet0.vp_c1)._m0[int(_241)][_243];
            float _247 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _249 = _235 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _251 = _235 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _253 = _247 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _255 = _247 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _257 = as_type<int>(_245) >> 31;
            bool _259 = as_type<int>(_245) == 1248;
            float _261 = as_type<float>(_257);
            float _263 = _251;
            float _265 = _245;
            float _267 = _255;
            if (!_259)
            {
                bool _269 = as_type<int>(_245) == 1296;
                _271 = _269;
                if (!_271)
                {
                    bool _273 = as_type<int>(_245) == 1360;
                    _275 = _273;
                    if (!_275)
                    {
                        bool _277 = as_type<int>(_245) == 1424;
                        _279 = _277;
                        if (!_279)
                        {
                            bool _281 = as_type<int>(_245) == 1504;
                            _283 = _281;
                            if (!_283)
                            {
                                bool _285 = as_type<int>(_245) == 1584;
                                _287 = _285;
                                if (!_287)
                                {
                                    bool _289 = as_type<int>(_245) == 1680;
                                    _291 = _289;
                                    if (!_291)
                                    {
                                        bool _293 = as_type<int>(_245) == 1760;
                                        _295 = _293;
                                        if (!_295)
                                        {
                                            bool _297 = as_type<int>(_245) == 1856;
                                            _299 = _297;
                                            if (!_299)
                                            {
                                                bool _301 = as_type<int>(_245) == 1920;
                                                _303 = _301;
                                                if (!_303)
                                                {
                                                    bool _305 = as_type<int>(_245) == 2000;
                                                    _307 = _305;
                                                    if (!_307)
                                                    {
                                                        bool _309 = as_type<int>(_245) == 2064;
                                                        _311 = _309;
                                                        if (!_311)
                                                        {
                                                            _313 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _319;
            float _321;
            if (!_271)
            {
                if (!_275)
                {
                    if (!_279)
                    {
                        if (!_283)
                        {
                            if (!_287)
                            {
                                if (!_291)
                                {
                                    if (!_295)
                                    {
                                        if (!_299)
                                        {
                                            if (!_303)
                                            {
                                                if (!_307)
                                                {
                                                    if (!_311)
                                                    {
                                                        if (!_313)
                                                        {
                                                            float _315 = _249 * _45;
                                                            float _317 = _253 * _47;
                                                            _319 = _317;
                                                            _321 = _315;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275) || _271)
            {
                if ((!_275) || _271)
                {
                    if ((!_279) || _271)
                    {
                        if ((!_283) || _271)
                        {
                            if ((!_287) || _271)
                            {
                                if ((!_291) || _271)
                                {
                                    if ((!_295) || _271)
                                    {
                                        if ((!_299) || _271)
                                        {
                                            if ((!_303) || _271)
                                            {
                                                if ((!_307) || _271)
                                                {
                                                    if ((!_311) || _271)
                                                    {
                                                        if ((!_313) || _271)
                                                        {
                                                            _271 = false;
                                                            float _323 = -_251;
                                                            float _325 = _323 + 1.0;
                                                            float _327 = _253 * _47;
                                                            float _329 = fma(_251, _45, _325);
                                                            _319 = _327;
                                                            _321 = _329;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275)
                {
                    if ((!_279) || _275)
                    {
                        if ((!_283) || _275)
                        {
                            if ((!_287) || _275)
                            {
                                if ((!_291) || _275)
                                {
                                    if ((!_295) || _275)
                                    {
                                        if ((!_299) || _275)
                                        {
                                            if ((!_303) || _275)
                                            {
                                                if ((!_307) || _275)
                                                {
                                                    if ((!_311) || _275)
                                                    {
                                                        if ((!_313) || _275)
                                                        {
                                                            _275 = false;
                                                            float _331 = -_255;
                                                            float _333 = _331 + 1.0;
                                                            float _335 = _249 * _45;
                                                            float _337 = fma(_255, _47, _333);
                                                            _319 = _337;
                                                            _321 = _335;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279)
                    {
                        if ((!_283) || _279)
                        {
                            if ((!_287) || _279)
                            {
                                if ((!_291) || _279)
                                {
                                    if ((!_295) || _279)
                                    {
                                        if ((!_299) || _279)
                                        {
                                            if ((!_303) || _279)
                                            {
                                                if ((!_307) || _279)
                                                {
                                                    if ((!_311) || _279)
                                                    {
                                                        if ((!_313) || _279)
                                                        {
                                                            _279 = false;
                                                            float _339 = -_251;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = -_255;
                                                            float _345 = _343 + 1.0;
                                                            float _347 = fma(_251, _45, _341);
                                                            float _349 = fma(_255, _47, _345);
                                                            _319 = _349;
                                                            _321 = _347;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283)
                        {
                            if ((!_287) || _283)
                            {
                                if ((!_291) || _283)
                                {
                                    if ((!_295) || _283)
                                    {
                                        if ((!_299) || _283)
                                        {
                                            if ((!_303) || _283)
                                            {
                                                if ((!_307) || _283)
                                                {
                                                    if ((!_311) || _283)
                                                    {
                                                        if ((!_313) || _283)
                                                        {
                                                            _283 = false;
                                                            float _351 = -_253;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = _249 * _45;
                                                            float _357 = -_255;
                                                            float _359 = _357 + _353;
                                                            float _361 = fma(_359, _47, _253);
                                                            _319 = _361;
                                                            _321 = _355;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287)
                            {
                                if ((!_291) || _287)
                                {
                                    if ((!_295) || _287)
                                    {
                                        if ((!_299) || _287)
                                        {
                                            if ((!_303) || _287)
                                            {
                                                if ((!_307) || _287)
                                                {
                                                    if ((!_311) || _287)
                                                    {
                                                        if ((!_313) || _287)
                                                        {
                                                            _287 = false;
                                                            float _363 = -_253;
                                                            float _365 = _363 + 1.0;
                                                            float _367 = -_251;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_255;
                                                            float _373 = _371 + _365;
                                                            float _375 = fma(_251, _45, _369);
                                                            float _377 = fma(_373, _47, _253);
                                                            _319 = _377;
                                                            _321 = _375;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291)
                                {
                                    if ((!_295) || _291)
                                    {
                                        if ((!_299) || _291)
                                        {
                                            if ((!_303) || _291)
                                            {
                                                if ((!_307) || _291)
                                                {
                                                    if ((!_311) || _291)
                                                    {
                                                        if ((!_313) || _291)
                                                        {
                                                            _291 = false;
                                                            float _379 = -_249;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _253 * _47;
                                                            float _385 = -_251;
                                                            float _387 = _385 + _381;
                                                            float _389 = fma(_387, _45, _249);
                                                            _319 = _383;
                                                            _321 = _389;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _313) || _311) || _307) || _303) || _299) || _295)
                                    {
                                        if ((!_299) || _295)
                                        {
                                            if ((!_303) || _295)
                                            {
                                                if ((!_307) || _295)
                                                {
                                                    if ((!_311) || _295)
                                                    {
                                                        if ((!_313) || _295)
                                                        {
                                                            _295 = false;
                                                            float _391 = -_249;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = -_255;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = -_251;
                                                            float _401 = _399 + _393;
                                                            float _403 = fma(_255, _47, _397);
                                                            float _405 = fma(_401, _45, _249);
                                                            _319 = _403;
                                                            _321 = _405;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _313) || _311) || _307) || _303) || _299)
                                        {
                                            if ((!_303) || _299)
                                            {
                                                if ((!_307) || _299)
                                                {
                                                    if ((!_311) || _299)
                                                    {
                                                        if ((!_313) || _299)
                                                        {
                                                            _299 = false;
                                                            float _407 = -_251;
                                                            float _409 = _407 + 1.0;
                                                            float _411 = _253 * _47;
                                                            float _413 = _409 * _45;
                                                            _319 = _411;
                                                            _321 = _413;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _313) || _311) || _307) || _303)
                                            {
                                                if ((!_307) || _303)
                                                {
                                                    if ((!_311) || _303)
                                                    {
                                                        if ((!_313) || _303)
                                                        {
                                                            _303 = false;
                                                            float _415 = -_251;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_255;
                                                            float _421 = _419 + 1.0;
                                                            float _423 = fma(_251, _45, _417);
                                                            float _425 = _421 * _47;
                                                            _319 = _425;
                                                            _321 = _423;
                                                        }
                                                    }
                                                }
                                                if (((false || _313) || _311) || _307)
                                                {
                                                    if ((!_311) || _307)
                                                    {
                                                        if ((!_313) || _307)
                                                        {
                                                            _307 = false;
                                                            float _427 = -_253;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = _249 * _45;
                                                            float _433 = fma(_429, _47, _253);
                                                            _319 = _433;
                                                            _321 = _431;
                                                        }
                                                    }
                                                    if ((false || _313) || _311)
                                                    {
                                                        if ((!_313) || _311)
                                                        {
                                                            _311 = false;
                                                            float _435 = -_249;
                                                            float _437 = _435 + 1.0;
                                                            float _439 = -_255;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = fma(_437, _45, _249);
                                                            float _445 = fma(_255, _47, _441);
                                                            _319 = _445;
                                                            _321 = _443;
                                                        }
                                                        if (false || _313)
                                                        {
                                                            _313 = false;
                                                            bool _447 = _227 != 12;
                                                            if (!_447)
                                                            {
                                                                float _449 = -_253;
                                                                float _451 = _449 + 1.0;
                                                                _261 = _451;
                                                            }
                                                            float _453 = _261;
                                                            if (!_447)
                                                            {
                                                                float _455 = -_251;
                                                                float _457 = _455 + 1.0;
                                                                _263 = _457;
                                                            }
                                                            float _459 = _263;
                                                            if (_447)
                                                            {
                                                                _265 = 0.0;
                                                            }
                                                            float _461 = _265;
                                                            float _463 = _461;
                                                            if (!_447)
                                                            {
                                                                float _465 = -_255;
                                                                float _467 = _465 + _453;
                                                                _267 = _467;
                                                            }
                                                            float _469 = _267;
                                                            if (_447)
                                                            {
                                                                _231 = 0.0;
                                                            }
                                                            float _471 = _231;
                                                            _319 = _471;
                                                            if (!_447)
                                                            {
                                                                float _473 = _45 * _459;
                                                                _463 = _473;
                                                            }
                                                            float _475 = _463;
                                                            _321 = _475;
                                                            if (!_447)
                                                            {
                                                                float _477 = _47 * _469;
                                                                _319 = _477;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _479 = _319;
            float _481 = _321;
            float _483 = -_479;
            float _485 = _483 + 1.0;
            float _487 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _489 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _491 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _493 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _495 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _497 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _499 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _501 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _503 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].x, _487);
            float _505 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].x, _489);
            float _507 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].y, _491);
            float _509 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].y, _493);
            float _511 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].z, _495);
            float _513 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].z, _497);
            float _515 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].w, _499);
            float _517 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].w, _501);
            float _519 = -_481;
            float _521 = _519 + 1.0;
            float _523 = _503 * _481;
            float _525 = _507 * _481;
            float _527 = _511 * _481;
            float _529 = _517 * _481;
            float _531 = fma(_521, _505, _523);
            float _533 = fma(_521, _509, _525);
            float _535 = fma(_521, _513, _527);
            float _537 = fma(_521, _515, _529);
            _144 = _45;
            _148 = _47;
            _152 = _531;
            _156 = _533;
            _160 = _535;
            _164 = _537;
            _166 = true;
        }
        else
        {
            float _539 = trunc(_45);
            int _541 = int(_539);
            float _543 = trunc(_47);
            int _545 = int(_543);
            int _547 = _545 << 1;
            int _549 = _547 + _541;
            int _551 = _549 << 4;
            bool _553 = _551 == 0;
            bool _555 = _551 == 16;
            bool _557 = _551 == 32;
            bool _559 = _551 == 48;
            if (_553)
            {
                _126 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _561 = _126;
            float _563 = _561;
            if (_553)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _565 = _128;
            bool _567 = _227 != 13;
            float _569 = _565;
            if (_555)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _571 = _563;
            float _573 = _571;
            if (_555)
            {
                _569 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _575 = _569;
            float _577 = _575;
            if (_557)
            {
                _573 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _579 = _573;
            float _581 = _579;
            if (_557)
            {
                _577 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _583 = _577;
            float _585 = _583;
            if (_559)
            {
                _581 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _587 = _581;
            _144 = _587;
            if (_559)
            {
                _585 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _589 = _585;
            if (!_567)
            {
                float _591 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _593 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _595 = _591 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _597 = -_595;
                float _599 = _597 + 1.0;
                float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _603 = -_591;
                float _605 = fma(_603, (*spvDescriptorSet0.vp_c3)._m0[26].w, _599);
                float _607 = -_601;
                float _609 = _607 + 1.0;
                float _611 = fma(_605, _47, _595);
                float _613 = -_593;
                float _615 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[26].y, _609);
                float _617 = -_611;
                float _619 = _617 + 1.0;
                float _621 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _623 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _625 = fma(_615, _45, _601);
                float _627 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _629 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _631 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _633 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _635 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _637 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _639 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].x, _621);
                float _641 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].y, _623);
                float _643 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].z, _631);
                float _645 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].w, _637);
                float _647 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].x, _627);
                float _649 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].y, _629);
                float _651 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].z, _633);
                float _653 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].w, _635);
                float _655 = -_625;
                float _657 = _655 + 1.0;
                float _659 = _625 * _639;
                float _661 = _625 * _641;
                float _663 = _625 * _643;
                float _665 = _625 * _645;
                float _667 = fma(_657, _647, _659);
                float _669 = fma(_657, _649, _661);
                float _671 = fma(_657, _651, _663);
                float _673 = fma(_657, _653, _665);
                _148 = _589;
                _152 = _667;
                _156 = _669;
                _160 = _671;
                _164 = _673;
                _166 = true;
            }
            else
            {
                int _675 = _549 << 4;
                int _677 = _675 + 464;
                uint _679 = uint(int(uint(_677) >> uint(2)));
                uint _681 = uint(int(uint(int(_679)) >> uint(2)));
                int _683 = int(_679) & 3;
                float _685 = (*spvDescriptorSet0.vp_c3)._m0[int(_681)][_683];
                int _687 = int(_679) + 1;
                uint _689 = uint(int(uint(_687) >> uint(2)));
                int _691 = _687 & 3;
                float _693 = (*spvDescriptorSet0.vp_c3)._m0[int(_689)][_691];
                int _695 = _677 + 8;
                uint _697 = uint(int(uint(_695) >> uint(2)));
                uint _699 = uint(int(uint(int(_697)) >> uint(2)));
                int _701 = int(_697) & 3;
                float _703 = (*spvDescriptorSet0.vp_c3)._m0[int(_699)][_701];
                int _705 = int(_697) + 1;
                uint _707 = uint(int(uint(_705) >> uint(2)));
                int _709 = _705 & 3;
                float _711 = (*spvDescriptorSet0.vp_c3)._m0[int(_707)][_709];
                _148 = _589;
                _152 = _685;
                _156 = _693;
                _160 = _703;
                _164 = _711;
            }
        }
    }
    _166 = false;
    float _713 = _144;
    float _715 = _148;
    bool _717 = _138;
    float _719 = _152;
    float _721 = _156;
    float _723 = _160;
    float _725 = _164;
    bool _727 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _729 = !_727;
    float _731 = _713;
    float _733 = _715;
    float _747;
    float _749;
    if (!_729)
    {
        float _735 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _737 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _739 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _735);
        float _741 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _737);
        float _743 = _739 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _745 = _741 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _747 = _745;
        _749 = _743;
        _751 = true;
    }
    else
    {
        int _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _755 = _753 != 0;
        if (!_755)
        {
            _130 = _713;
        }
        float _757 = _130;
        float _759 = _757;
        _749 = _757;
        if (!_755)
        {
            _132 = _715;
        }
        float _761 = _132;
        bool _763 = !_755;
        float _765 = _761;
        _747 = _761;
        if (!_763)
        {
            if (!_717)
            {
                _759 = _713;
            }
            float _767 = _759;
            float _769 = _767;
            int _771 = as_type<int>(_767);
            if (!_717)
            {
                _765 = _715;
            }
            float _773 = _765;
            bool _775 = !_717;
            float _777 = _773;
            float _779 = _773;
            if (!_775)
            {
                int _781 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _783 = _781 != 0;
                int _785 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _787 = _785 != 0;
                int _789 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _791 = _789 != 0;
                int _793 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _795 = _793 != 0;
                int _797 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _799 = _797 != 0;
                if (_783)
                {
                    _769 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _801 = _769;
                float _803 = _801;
                if (_783)
                {
                    _777 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _805 = _777;
                float _807 = _805;
                if (!_783)
                {
                    _803 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _809 = _803;
                if (!_783)
                {
                    _807 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _811 = _807;
                float _813 = _809 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _815 = _811 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_795)
                {
                    float _817 = _813 * _713;
                    _731 = _817;
                }
                float _819 = _731;
                float _821 = -_813;
                float _823 = _821 + 1.0;
                int _825 = as_type<int>(_819);
                if (_799)
                {
                    float _827 = _815 * _715;
                    _733 = _827;
                }
                float _829 = _733;
                float _831 = -_815;
                float _833 = _831 + 1.0;
                float _835 = _829;
                if (_787)
                {
                    float _837 = _819 + _823;
                    _825 = as_type<int>(_837);
                }
                int _839 = _825;
                if (_791)
                {
                    float _841 = _829 + _833;
                    _835 = _841;
                }
                float _843 = _835;
                _771 = _839;
                _779 = _843;
            }
            int _845 = _771;
            float _847 = _779;
            int _849 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _851 = _849 != 0;
            int _853 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _855 = _853 != 0;
            int _857 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _859 = _857 != 0;
            int _861 = _845;
            int _863 = as_type<int>(_847);
            if (_855)
            {
                float _865 = -as_type<float>(_845);
                float _867 = _865 + 1.0;
                _861 = as_type<int>(_867);
            }
            int _869 = _861;
            if (_859)
            {
                float _871 = -_847;
                float _873 = _871 + 1.0;
                _863 = as_type<int>(_873);
            }
            int _875 = _863;
            bool _877 = !_851;
            float _879 = _877 ? as_type<float>(_869) : as_type<float>(_875);
            bool _881 = !_851;
            float _883 = _881 ? as_type<float>(_875) : as_type<float>(_869);
            _747 = _883;
            _749 = _879;
        }
    }
    _751 = false;
    float _885 = _747;
    float _887 = _749;
    float _889 = _885 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _891 = _885 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _893 = _719 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _895 = _721 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c3)._m0[8].x, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c3)._m0[7].x, _891);
    float _901 = _723 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _903 = _725 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _905 = _897 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _907 = _899 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    out.m_27.x = _45;
    out.m_27.y = _47;
    float _909 = -_905;
    float _911 = _909 + 1.0;
    out.m_29.x = _893;
    out.m_29.y = _895;
    out.m_29.z = _901;
    out.m_29.w = _903;
    out.m_31.x = _907;
    out.m_31.y = _911;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _751 = false;
    bool _166 = false;
    bool _313 = false;
    bool _311 = false;
    bool _307 = false;
    bool _303 = false;
    bool _299 = false;
    bool _295 = false;
    bool _291 = false;
    bool _287 = false;
    bool _283 = false;
    bool _279 = false;
    bool _275 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_24.x;
    float _47 = in.m_24.y;
    float _49 = -_47;
    float _51 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _53 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _97;
    out.gl_Position.y = _99;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _101;
    float _116 = _89;
    float _118 = _67;
    float _120 = _91;
    float _122 = _97;
    float _124 = _99;
    float _126 = _101;
    float _128 = _103;
    float _130 = _53;
    float _132 = _51;
    bool _138;
    float _144;
    float _148;
    float _152;
    float _156;
    float _160;
    float _164;
    if (!_112)
    {
        int _134 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _136 = _134 != 0;
        _138 = _136;
        if (_136)
        {
            _114 = _45;
        }
        float _140 = _114;
        float _142 = _140;
        _144 = _140;
        if (_136)
        {
            _116 = _47;
        }
        float _146 = _116;
        _148 = _146;
        if (_136)
        {
            _118 = 255.0;
        }
        float _150 = _118;
        _152 = _150;
        if (_136)
        {
            _120 = 255.0;
        }
        float _154 = _120;
        _156 = _154;
        if (_136)
        {
            _122 = 255.0;
        }
        float _158 = _122;
        _160 = _158;
        if (_136)
        {
            _124 = 255.0;
        }
        float _162 = _124;
        _164 = _162;
        _166 = _136;
        if (!_166)
        {
            float _168 = trunc(_45);
            int _170 = int(_168);
            float _172 = trunc(_47);
            int _174 = int(_172);
            int _176 = _174 << 1;
            int _178 = _176 + _170;
            int _180 = _178 << 4;
            bool _182 = _180 == 0;
            bool _184 = _180 == 16;
            bool _186 = _180 == 32;
            bool _188 = _180 == 48;
            float _190 = as_type<float>(_180);
            _152 = 255.0;
            _156 = 255.0;
            _160 = 255.0;
            _164 = 255.0;
            if (_182)
            {
                _142 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _192 = _142;
            float _194 = _192;
            if (_182)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _196 = _190;
            float _198 = _196;
            if (_184)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _200 = _194;
            float _202 = _200;
            if (_184)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _204 = _198;
            float _206 = _204;
            if (_186)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _208 = _202;
            float _210 = _208;
            if (_186)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _212 = _206;
            float _214 = _212;
            if (_188)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _216 = _210;
            _144 = _216;
            if (_188)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _218 = _214;
            _148 = _218;
            _166 = true;
        }
    }
    else
    {
        int _220 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _222 = _220 != 0;
        uint _225 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _227 = int(_225) & 15;
        bool _229 = !_222;
        float _231 = as_type<float>(_227);
        _138 = _222;
        if (!_229)
        {
            uint _233 = min(uint(_227), 13u);
            float _235 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _237 = int(_233) << 2;
            uint _239 = uint(int(uint(_237) >> uint(2)));
            uint _241 = uint(int(uint(int(_239)) >> uint(2)));
            int _243 = int(_239) & 3;
            float _245 = (*spvDescriptorSet0.vp_c1)._m0[int(_241)][_243];
            float _247 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _249 = _235 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _251 = _235 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _253 = _247 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _255 = _247 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _257 = as_type<int>(_245) >> 31;
            bool _259 = as_type<int>(_245) == 1248;
            float _261 = as_type<float>(_257);
            float _263 = _251;
            float _265 = _245;
            float _267 = _255;
            if (!_259)
            {
                bool _269 = as_type<int>(_245) == 1296;
                _271 = _269;
                if (!_271)
                {
                    bool _273 = as_type<int>(_245) == 1360;
                    _275 = _273;
                    if (!_275)
                    {
                        bool _277 = as_type<int>(_245) == 1424;
                        _279 = _277;
                        if (!_279)
                        {
                            bool _281 = as_type<int>(_245) == 1504;
                            _283 = _281;
                            if (!_283)
                            {
                                bool _285 = as_type<int>(_245) == 1584;
                                _287 = _285;
                                if (!_287)
                                {
                                    bool _289 = as_type<int>(_245) == 1680;
                                    _291 = _289;
                                    if (!_291)
                                    {
                                        bool _293 = as_type<int>(_245) == 1760;
                                        _295 = _293;
                                        if (!_295)
                                        {
                                            bool _297 = as_type<int>(_245) == 1856;
                                            _299 = _297;
                                            if (!_299)
                                            {
                                                bool _301 = as_type<int>(_245) == 1920;
                                                _303 = _301;
                                                if (!_303)
                                                {
                                                    bool _305 = as_type<int>(_245) == 2000;
                                                    _307 = _305;
                                                    if (!_307)
                                                    {
                                                        bool _309 = as_type<int>(_245) == 2064;
                                                        _311 = _309;
                                                        if (!_311)
                                                        {
                                                            _313 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _319;
            float _321;
            if (!_271)
            {
                if (!_275)
                {
                    if (!_279)
                    {
                        if (!_283)
                        {
                            if (!_287)
                            {
                                if (!_291)
                                {
                                    if (!_295)
                                    {
                                        if (!_299)
                                        {
                                            if (!_303)
                                            {
                                                if (!_307)
                                                {
                                                    if (!_311)
                                                    {
                                                        if (!_313)
                                                        {
                                                            float _315 = _249 * _45;
                                                            float _317 = _253 * _47;
                                                            _319 = _317;
                                                            _321 = _315;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275) || _271)
            {
                if ((!_275) || _271)
                {
                    if ((!_279) || _271)
                    {
                        if ((!_283) || _271)
                        {
                            if ((!_287) || _271)
                            {
                                if ((!_291) || _271)
                                {
                                    if ((!_295) || _271)
                                    {
                                        if ((!_299) || _271)
                                        {
                                            if ((!_303) || _271)
                                            {
                                                if ((!_307) || _271)
                                                {
                                                    if ((!_311) || _271)
                                                    {
                                                        if ((!_313) || _271)
                                                        {
                                                            _271 = false;
                                                            float _323 = -_251;
                                                            float _325 = _323 + 1.0;
                                                            float _327 = _253 * _47;
                                                            float _329 = fma(_251, _45, _325);
                                                            _319 = _327;
                                                            _321 = _329;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275)
                {
                    if ((!_279) || _275)
                    {
                        if ((!_283) || _275)
                        {
                            if ((!_287) || _275)
                            {
                                if ((!_291) || _275)
                                {
                                    if ((!_295) || _275)
                                    {
                                        if ((!_299) || _275)
                                        {
                                            if ((!_303) || _275)
                                            {
                                                if ((!_307) || _275)
                                                {
                                                    if ((!_311) || _275)
                                                    {
                                                        if ((!_313) || _275)
                                                        {
                                                            _275 = false;
                                                            float _331 = -_255;
                                                            float _333 = _331 + 1.0;
                                                            float _335 = _249 * _45;
                                                            float _337 = fma(_255, _47, _333);
                                                            _319 = _337;
                                                            _321 = _335;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279)
                    {
                        if ((!_283) || _279)
                        {
                            if ((!_287) || _279)
                            {
                                if ((!_291) || _279)
                                {
                                    if ((!_295) || _279)
                                    {
                                        if ((!_299) || _279)
                                        {
                                            if ((!_303) || _279)
                                            {
                                                if ((!_307) || _279)
                                                {
                                                    if ((!_311) || _279)
                                                    {
                                                        if ((!_313) || _279)
                                                        {
                                                            _279 = false;
                                                            float _339 = -_251;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = -_255;
                                                            float _345 = _343 + 1.0;
                                                            float _347 = fma(_251, _45, _341);
                                                            float _349 = fma(_255, _47, _345);
                                                            _319 = _349;
                                                            _321 = _347;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283)
                        {
                            if ((!_287) || _283)
                            {
                                if ((!_291) || _283)
                                {
                                    if ((!_295) || _283)
                                    {
                                        if ((!_299) || _283)
                                        {
                                            if ((!_303) || _283)
                                            {
                                                if ((!_307) || _283)
                                                {
                                                    if ((!_311) || _283)
                                                    {
                                                        if ((!_313) || _283)
                                                        {
                                                            _283 = false;
                                                            float _351 = -_253;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = _249 * _45;
                                                            float _357 = -_255;
                                                            float _359 = _357 + _353;
                                                            float _361 = fma(_359, _47, _253);
                                                            _319 = _361;
                                                            _321 = _355;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287)
                            {
                                if ((!_291) || _287)
                                {
                                    if ((!_295) || _287)
                                    {
                                        if ((!_299) || _287)
                                        {
                                            if ((!_303) || _287)
                                            {
                                                if ((!_307) || _287)
                                                {
                                                    if ((!_311) || _287)
                                                    {
                                                        if ((!_313) || _287)
                                                        {
                                                            _287 = false;
                                                            float _363 = -_253;
                                                            float _365 = _363 + 1.0;
                                                            float _367 = -_251;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_255;
                                                            float _373 = _371 + _365;
                                                            float _375 = fma(_251, _45, _369);
                                                            float _377 = fma(_373, _47, _253);
                                                            _319 = _377;
                                                            _321 = _375;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291)
                                {
                                    if ((!_295) || _291)
                                    {
                                        if ((!_299) || _291)
                                        {
                                            if ((!_303) || _291)
                                            {
                                                if ((!_307) || _291)
                                                {
                                                    if ((!_311) || _291)
                                                    {
                                                        if ((!_313) || _291)
                                                        {
                                                            _291 = false;
                                                            float _379 = -_249;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _253 * _47;
                                                            float _385 = -_251;
                                                            float _387 = _385 + _381;
                                                            float _389 = fma(_387, _45, _249);
                                                            _319 = _383;
                                                            _321 = _389;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _313) || _311) || _307) || _303) || _299) || _295)
                                    {
                                        if ((!_299) || _295)
                                        {
                                            if ((!_303) || _295)
                                            {
                                                if ((!_307) || _295)
                                                {
                                                    if ((!_311) || _295)
                                                    {
                                                        if ((!_313) || _295)
                                                        {
                                                            _295 = false;
                                                            float _391 = -_249;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = -_255;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = -_251;
                                                            float _401 = _399 + _393;
                                                            float _403 = fma(_255, _47, _397);
                                                            float _405 = fma(_401, _45, _249);
                                                            _319 = _403;
                                                            _321 = _405;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _313) || _311) || _307) || _303) || _299)
                                        {
                                            if ((!_303) || _299)
                                            {
                                                if ((!_307) || _299)
                                                {
                                                    if ((!_311) || _299)
                                                    {
                                                        if ((!_313) || _299)
                                                        {
                                                            _299 = false;
                                                            float _407 = -_251;
                                                            float _409 = _407 + 1.0;
                                                            float _411 = _253 * _47;
                                                            float _413 = _409 * _45;
                                                            _319 = _411;
                                                            _321 = _413;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _313) || _311) || _307) || _303)
                                            {
                                                if ((!_307) || _303)
                                                {
                                                    if ((!_311) || _303)
                                                    {
                                                        if ((!_313) || _303)
                                                        {
                                                            _303 = false;
                                                            float _415 = -_251;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_255;
                                                            float _421 = _419 + 1.0;
                                                            float _423 = fma(_251, _45, _417);
                                                            float _425 = _421 * _47;
                                                            _319 = _425;
                                                            _321 = _423;
                                                        }
                                                    }
                                                }
                                                if (((false || _313) || _311) || _307)
                                                {
                                                    if ((!_311) || _307)
                                                    {
                                                        if ((!_313) || _307)
                                                        {
                                                            _307 = false;
                                                            float _427 = -_253;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = _249 * _45;
                                                            float _433 = fma(_429, _47, _253);
                                                            _319 = _433;
                                                            _321 = _431;
                                                        }
                                                    }
                                                    if ((false || _313) || _311)
                                                    {
                                                        if ((!_313) || _311)
                                                        {
                                                            _311 = false;
                                                            float _435 = -_249;
                                                            float _437 = _435 + 1.0;
                                                            float _439 = -_255;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = fma(_437, _45, _249);
                                                            float _445 = fma(_255, _47, _441);
                                                            _319 = _445;
                                                            _321 = _443;
                                                        }
                                                        if (false || _313)
                                                        {
                                                            _313 = false;
                                                            bool _447 = _227 != 12;
                                                            if (!_447)
                                                            {
                                                                float _449 = -_253;
                                                                float _451 = _449 + 1.0;
                                                                _261 = _451;
                                                            }
                                                            float _453 = _261;
                                                            if (!_447)
                                                            {
                                                                float _455 = -_251;
                                                                float _457 = _455 + 1.0;
                                                                _263 = _457;
                                                            }
                                                            float _459 = _263;
                                                            if (_447)
                                                            {
                                                                _265 = 0.0;
                                                            }
                                                            float _461 = _265;
                                                            float _463 = _461;
                                                            if (!_447)
                                                            {
                                                                float _465 = -_255;
                                                                float _467 = _465 + _453;
                                                                _267 = _467;
                                                            }
                                                            float _469 = _267;
                                                            if (_447)
                                                            {
                                                                _231 = 0.0;
                                                            }
                                                            float _471 = _231;
                                                            _319 = _471;
                                                            if (!_447)
                                                            {
                                                                float _473 = _45 * _459;
                                                                _463 = _473;
                                                            }
                                                            float _475 = _463;
                                                            _321 = _475;
                                                            if (!_447)
                                                            {
                                                                float _477 = _47 * _469;
                                                                _319 = _477;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _479 = _319;
            float _481 = _321;
            float _483 = -_479;
            float _485 = _483 + 1.0;
            float _487 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _489 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _491 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _493 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _495 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _497 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _499 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _501 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _503 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].x, _487);
            float _505 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].x, _489);
            float _507 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].y, _491);
            float _509 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].y, _493);
            float _511 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].z, _495);
            float _513 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].z, _497);
            float _515 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].w, _499);
            float _517 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].w, _501);
            float _519 = -_481;
            float _521 = _519 + 1.0;
            float _523 = _503 * _481;
            float _525 = _507 * _481;
            float _527 = _511 * _481;
            float _529 = _517 * _481;
            float _531 = fma(_521, _505, _523);
            float _533 = fma(_521, _509, _525);
            float _535 = fma(_521, _513, _527);
            float _537 = fma(_521, _515, _529);
            _144 = _45;
            _148 = _47;
            _152 = _531;
            _156 = _533;
            _160 = _535;
            _164 = _537;
            _166 = true;
        }
        else
        {
            float _539 = trunc(_45);
            int _541 = int(_539);
            float _543 = trunc(_47);
            int _545 = int(_543);
            int _547 = _545 << 1;
            int _549 = _547 + _541;
            int _551 = _549 << 4;
            bool _553 = _551 == 0;
            bool _555 = _551 == 16;
            bool _557 = _551 == 32;
            bool _559 = _551 == 48;
            if (_553)
            {
                _126 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _561 = _126;
            float _563 = _561;
            if (_553)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _565 = _128;
            bool _567 = _227 != 13;
            float _569 = _565;
            if (_555)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _571 = _563;
            float _573 = _571;
            if (_555)
            {
                _569 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _575 = _569;
            float _577 = _575;
            if (_557)
            {
                _573 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _579 = _573;
            float _581 = _579;
            if (_557)
            {
                _577 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _583 = _577;
            float _585 = _583;
            if (_559)
            {
                _581 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _587 = _581;
            _144 = _587;
            if (_559)
            {
                _585 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _589 = _585;
            if (!_567)
            {
                float _591 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _593 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _595 = _591 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _597 = -_595;
                float _599 = _597 + 1.0;
                float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _603 = -_591;
                float _605 = fma(_603, (*spvDescriptorSet0.vp_c3)._m0[26].w, _599);
                float _607 = -_601;
                float _609 = _607 + 1.0;
                float _611 = fma(_605, _47, _595);
                float _613 = -_593;
                float _615 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[26].y, _609);
                float _617 = -_611;
                float _619 = _617 + 1.0;
                float _621 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _623 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _625 = fma(_615, _45, _601);
                float _627 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _629 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _631 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _633 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _635 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _637 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _639 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].x, _621);
                float _641 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].y, _623);
                float _643 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].z, _631);
                float _645 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].w, _637);
                float _647 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].x, _627);
                float _649 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].y, _629);
                float _651 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].z, _633);
                float _653 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].w, _635);
                float _655 = -_625;
                float _657 = _655 + 1.0;
                float _659 = _625 * _639;
                float _661 = _625 * _641;
                float _663 = _625 * _643;
                float _665 = _625 * _645;
                float _667 = fma(_657, _647, _659);
                float _669 = fma(_657, _649, _661);
                float _671 = fma(_657, _651, _663);
                float _673 = fma(_657, _653, _665);
                _148 = _589;
                _152 = _667;
                _156 = _669;
                _160 = _671;
                _164 = _673;
                _166 = true;
            }
            else
            {
                int _675 = _549 << 4;
                int _677 = _675 + 464;
                uint _679 = uint(int(uint(_677) >> uint(2)));
                uint _681 = uint(int(uint(int(_679)) >> uint(2)));
                int _683 = int(_679) & 3;
                float _685 = (*spvDescriptorSet0.vp_c3)._m0[int(_681)][_683];
                int _687 = int(_679) + 1;
                uint _689 = uint(int(uint(_687) >> uint(2)));
                int _691 = _687 & 3;
                float _693 = (*spvDescriptorSet0.vp_c3)._m0[int(_689)][_691];
                int _695 = _677 + 8;
                uint _697 = uint(int(uint(_695) >> uint(2)));
                uint _699 = uint(int(uint(int(_697)) >> uint(2)));
                int _701 = int(_697) & 3;
                float _703 = (*spvDescriptorSet0.vp_c3)._m0[int(_699)][_701];
                int _705 = int(_697) + 1;
                uint _707 = uint(int(uint(_705) >> uint(2)));
                int _709 = _705 & 3;
                float _711 = (*spvDescriptorSet0.vp_c3)._m0[int(_707)][_709];
                _148 = _589;
                _152 = _685;
                _156 = _693;
                _160 = _703;
                _164 = _711;
            }
        }
    }
    _166 = false;
    float _713 = _144;
    float _715 = _148;
    bool _717 = _138;
    float _719 = _152;
    float _721 = _156;
    float _723 = _160;
    float _725 = _164;
    bool _727 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _729 = !_727;
    float _731 = _713;
    float _733 = _715;
    float _747;
    float _749;
    if (!_729)
    {
        float _735 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _737 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _739 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _735);
        float _741 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _737);
        float _743 = _739 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _745 = _741 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _747 = _745;
        _749 = _743;
        _751 = true;
    }
    else
    {
        int _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _755 = _753 != 0;
        if (!_755)
        {
            _130 = _713;
        }
        float _757 = _130;
        float _759 = _757;
        _749 = _757;
        if (!_755)
        {
            _132 = _715;
        }
        float _761 = _132;
        bool _763 = !_755;
        float _765 = _761;
        _747 = _761;
        if (!_763)
        {
            if (!_717)
            {
                _759 = _713;
            }
            float _767 = _759;
            float _769 = _767;
            int _771 = as_type<int>(_767);
            if (!_717)
            {
                _765 = _715;
            }
            float _773 = _765;
            bool _775 = !_717;
            float _777 = _773;
            float _779 = _773;
            if (!_775)
            {
                int _781 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _783 = _781 != 0;
                int _785 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _787 = _785 != 0;
                int _789 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _791 = _789 != 0;
                int _793 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _795 = _793 != 0;
                int _797 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _799 = _797 != 0;
                if (_783)
                {
                    _769 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _801 = _769;
                float _803 = _801;
                if (_783)
                {
                    _777 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _805 = _777;
                float _807 = _805;
                if (!_783)
                {
                    _803 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _809 = _803;
                if (!_783)
                {
                    _807 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _811 = _807;
                float _813 = _809 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _815 = _811 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_795)
                {
                    float _817 = _813 * _713;
                    _731 = _817;
                }
                float _819 = _731;
                float _821 = -_813;
                float _823 = _821 + 1.0;
                int _825 = as_type<int>(_819);
                if (_799)
                {
                    float _827 = _815 * _715;
                    _733 = _827;
                }
                float _829 = _733;
                float _831 = -_815;
                float _833 = _831 + 1.0;
                float _835 = _829;
                if (_787)
                {
                    float _837 = _819 + _823;
                    _825 = as_type<int>(_837);
                }
                int _839 = _825;
                if (_791)
                {
                    float _841 = _829 + _833;
                    _835 = _841;
                }
                float _843 = _835;
                _771 = _839;
                _779 = _843;
            }
            int _845 = _771;
            float _847 = _779;
            int _849 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _851 = _849 != 0;
            int _853 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _855 = _853 != 0;
            int _857 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _859 = _857 != 0;
            int _861 = _845;
            int _863 = as_type<int>(_847);
            if (_855)
            {
                float _865 = -as_type<float>(_845);
                float _867 = _865 + 1.0;
                _861 = as_type<int>(_867);
            }
            int _869 = _861;
            if (_859)
            {
                float _871 = -_847;
                float _873 = _871 + 1.0;
                _863 = as_type<int>(_873);
            }
            int _875 = _863;
            bool _877 = !_851;
            float _879 = _877 ? as_type<float>(_869) : as_type<float>(_875);
            bool _881 = !_851;
            float _883 = _881 ? as_type<float>(_875) : as_type<float>(_869);
            _747 = _883;
            _749 = _879;
        }
    }
    _751 = false;
    float _885 = _747;
    float _887 = _749;
    float _889 = _885 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _891 = _885 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _893 = _719 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _895 = _721 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c3)._m0[8].x, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c3)._m0[7].x, _891);
    float _901 = _723 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _903 = _725 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _905 = _897 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _907 = _899 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    out.m_27.x = _45;
    out.m_27.y = _47;
    float _909 = -_905;
    float _911 = _909 + 1.0;
    out.m_29.x = _893;
    out.m_29.y = _895;
    out.m_29.z = _901;
    out.m_29.w = _903;
    out.m_31.x = _907;
    out.m_31.y = _911;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _751 = false;
    bool _166 = false;
    bool _313 = false;
    bool _311 = false;
    bool _307 = false;
    bool _303 = false;
    bool _299 = false;
    bool _295 = false;
    bool _291 = false;
    bool _287 = false;
    bool _283 = false;
    bool _279 = false;
    bool _275 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_24.x;
    float _47 = in.m_24.y;
    float _49 = -_47;
    float _51 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _53 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _97;
    out.gl_Position.y = _99;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _101;
    float _116 = _89;
    float _118 = _67;
    float _120 = _91;
    float _122 = _97;
    float _124 = _99;
    float _126 = _101;
    float _128 = _103;
    float _130 = _53;
    float _132 = _51;
    bool _138;
    float _144;
    float _148;
    float _152;
    float _156;
    float _160;
    float _164;
    if (!_112)
    {
        int _134 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _136 = _134 != 0;
        _138 = _136;
        if (_136)
        {
            _114 = _45;
        }
        float _140 = _114;
        float _142 = _140;
        _144 = _140;
        if (_136)
        {
            _116 = _47;
        }
        float _146 = _116;
        _148 = _146;
        if (_136)
        {
            _118 = 255.0;
        }
        float _150 = _118;
        _152 = _150;
        if (_136)
        {
            _120 = 255.0;
        }
        float _154 = _120;
        _156 = _154;
        if (_136)
        {
            _122 = 255.0;
        }
        float _158 = _122;
        _160 = _158;
        if (_136)
        {
            _124 = 255.0;
        }
        float _162 = _124;
        _164 = _162;
        _166 = _136;
        if (!_166)
        {
            float _168 = trunc(_45);
            int _170 = int(_168);
            float _172 = trunc(_47);
            int _174 = int(_172);
            int _176 = _174 << 1;
            int _178 = _176 + _170;
            int _180 = _178 << 4;
            bool _182 = _180 == 0;
            bool _184 = _180 == 16;
            bool _186 = _180 == 32;
            bool _188 = _180 == 48;
            float _190 = as_type<float>(_180);
            _152 = 255.0;
            _156 = 255.0;
            _160 = 255.0;
            _164 = 255.0;
            if (_182)
            {
                _142 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _192 = _142;
            float _194 = _192;
            if (_182)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _196 = _190;
            float _198 = _196;
            if (_184)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _200 = _194;
            float _202 = _200;
            if (_184)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _204 = _198;
            float _206 = _204;
            if (_186)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _208 = _202;
            float _210 = _208;
            if (_186)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _212 = _206;
            float _214 = _212;
            if (_188)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _216 = _210;
            _144 = _216;
            if (_188)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _218 = _214;
            _148 = _218;
            _166 = true;
        }
    }
    else
    {
        int _220 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _222 = _220 != 0;
        uint _225 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _227 = int(_225) & 15;
        bool _229 = !_222;
        float _231 = as_type<float>(_227);
        _138 = _222;
        if (!_229)
        {
            uint _233 = min(uint(_227), 13u);
            float _235 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _237 = int(_233) << 2;
            uint _239 = uint(int(uint(_237) >> uint(2)));
            uint _241 = uint(int(uint(int(_239)) >> uint(2)));
            int _243 = int(_239) & 3;
            float _245 = (*spvDescriptorSet0.vp_c1)._m0[int(_241)][_243];
            float _247 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _249 = _235 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _251 = _235 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _253 = _247 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _255 = _247 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _257 = as_type<int>(_245) >> 31;
            bool _259 = as_type<int>(_245) == 1248;
            float _261 = as_type<float>(_257);
            float _263 = _251;
            float _265 = _245;
            float _267 = _255;
            if (!_259)
            {
                bool _269 = as_type<int>(_245) == 1296;
                _271 = _269;
                if (!_271)
                {
                    bool _273 = as_type<int>(_245) == 1360;
                    _275 = _273;
                    if (!_275)
                    {
                        bool _277 = as_type<int>(_245) == 1424;
                        _279 = _277;
                        if (!_279)
                        {
                            bool _281 = as_type<int>(_245) == 1504;
                            _283 = _281;
                            if (!_283)
                            {
                                bool _285 = as_type<int>(_245) == 1584;
                                _287 = _285;
                                if (!_287)
                                {
                                    bool _289 = as_type<int>(_245) == 1680;
                                    _291 = _289;
                                    if (!_291)
                                    {
                                        bool _293 = as_type<int>(_245) == 1760;
                                        _295 = _293;
                                        if (!_295)
                                        {
                                            bool _297 = as_type<int>(_245) == 1856;
                                            _299 = _297;
                                            if (!_299)
                                            {
                                                bool _301 = as_type<int>(_245) == 1920;
                                                _303 = _301;
                                                if (!_303)
                                                {
                                                    bool _305 = as_type<int>(_245) == 2000;
                                                    _307 = _305;
                                                    if (!_307)
                                                    {
                                                        bool _309 = as_type<int>(_245) == 2064;
                                                        _311 = _309;
                                                        if (!_311)
                                                        {
                                                            _313 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _319;
            float _321;
            if (!_271)
            {
                if (!_275)
                {
                    if (!_279)
                    {
                        if (!_283)
                        {
                            if (!_287)
                            {
                                if (!_291)
                                {
                                    if (!_295)
                                    {
                                        if (!_299)
                                        {
                                            if (!_303)
                                            {
                                                if (!_307)
                                                {
                                                    if (!_311)
                                                    {
                                                        if (!_313)
                                                        {
                                                            float _315 = _249 * _45;
                                                            float _317 = _253 * _47;
                                                            _319 = _317;
                                                            _321 = _315;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275) || _271)
            {
                if ((!_275) || _271)
                {
                    if ((!_279) || _271)
                    {
                        if ((!_283) || _271)
                        {
                            if ((!_287) || _271)
                            {
                                if ((!_291) || _271)
                                {
                                    if ((!_295) || _271)
                                    {
                                        if ((!_299) || _271)
                                        {
                                            if ((!_303) || _271)
                                            {
                                                if ((!_307) || _271)
                                                {
                                                    if ((!_311) || _271)
                                                    {
                                                        if ((!_313) || _271)
                                                        {
                                                            _271 = false;
                                                            float _323 = -_251;
                                                            float _325 = _323 + 1.0;
                                                            float _327 = _253 * _47;
                                                            float _329 = fma(_251, _45, _325);
                                                            _319 = _327;
                                                            _321 = _329;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275)
                {
                    if ((!_279) || _275)
                    {
                        if ((!_283) || _275)
                        {
                            if ((!_287) || _275)
                            {
                                if ((!_291) || _275)
                                {
                                    if ((!_295) || _275)
                                    {
                                        if ((!_299) || _275)
                                        {
                                            if ((!_303) || _275)
                                            {
                                                if ((!_307) || _275)
                                                {
                                                    if ((!_311) || _275)
                                                    {
                                                        if ((!_313) || _275)
                                                        {
                                                            _275 = false;
                                                            float _331 = -_255;
                                                            float _333 = _331 + 1.0;
                                                            float _335 = _249 * _45;
                                                            float _337 = fma(_255, _47, _333);
                                                            _319 = _337;
                                                            _321 = _335;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279)
                    {
                        if ((!_283) || _279)
                        {
                            if ((!_287) || _279)
                            {
                                if ((!_291) || _279)
                                {
                                    if ((!_295) || _279)
                                    {
                                        if ((!_299) || _279)
                                        {
                                            if ((!_303) || _279)
                                            {
                                                if ((!_307) || _279)
                                                {
                                                    if ((!_311) || _279)
                                                    {
                                                        if ((!_313) || _279)
                                                        {
                                                            _279 = false;
                                                            float _339 = -_251;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = -_255;
                                                            float _345 = _343 + 1.0;
                                                            float _347 = fma(_251, _45, _341);
                                                            float _349 = fma(_255, _47, _345);
                                                            _319 = _349;
                                                            _321 = _347;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283)
                        {
                            if ((!_287) || _283)
                            {
                                if ((!_291) || _283)
                                {
                                    if ((!_295) || _283)
                                    {
                                        if ((!_299) || _283)
                                        {
                                            if ((!_303) || _283)
                                            {
                                                if ((!_307) || _283)
                                                {
                                                    if ((!_311) || _283)
                                                    {
                                                        if ((!_313) || _283)
                                                        {
                                                            _283 = false;
                                                            float _351 = -_253;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = _249 * _45;
                                                            float _357 = -_255;
                                                            float _359 = _357 + _353;
                                                            float _361 = fma(_359, _47, _253);
                                                            _319 = _361;
                                                            _321 = _355;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291) || _287)
                            {
                                if ((!_291) || _287)
                                {
                                    if ((!_295) || _287)
                                    {
                                        if ((!_299) || _287)
                                        {
                                            if ((!_303) || _287)
                                            {
                                                if ((!_307) || _287)
                                                {
                                                    if ((!_311) || _287)
                                                    {
                                                        if ((!_313) || _287)
                                                        {
                                                            _287 = false;
                                                            float _363 = -_253;
                                                            float _365 = _363 + 1.0;
                                                            float _367 = -_251;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_255;
                                                            float _373 = _371 + _365;
                                                            float _375 = fma(_251, _45, _369);
                                                            float _377 = fma(_373, _47, _253);
                                                            _319 = _377;
                                                            _321 = _375;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _313) || _311) || _307) || _303) || _299) || _295) || _291)
                                {
                                    if ((!_295) || _291)
                                    {
                                        if ((!_299) || _291)
                                        {
                                            if ((!_303) || _291)
                                            {
                                                if ((!_307) || _291)
                                                {
                                                    if ((!_311) || _291)
                                                    {
                                                        if ((!_313) || _291)
                                                        {
                                                            _291 = false;
                                                            float _379 = -_249;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _253 * _47;
                                                            float _385 = -_251;
                                                            float _387 = _385 + _381;
                                                            float _389 = fma(_387, _45, _249);
                                                            _319 = _383;
                                                            _321 = _389;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _313) || _311) || _307) || _303) || _299) || _295)
                                    {
                                        if ((!_299) || _295)
                                        {
                                            if ((!_303) || _295)
                                            {
                                                if ((!_307) || _295)
                                                {
                                                    if ((!_311) || _295)
                                                    {
                                                        if ((!_313) || _295)
                                                        {
                                                            _295 = false;
                                                            float _391 = -_249;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = -_255;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = -_251;
                                                            float _401 = _399 + _393;
                                                            float _403 = fma(_255, _47, _397);
                                                            float _405 = fma(_401, _45, _249);
                                                            _319 = _403;
                                                            _321 = _405;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _313) || _311) || _307) || _303) || _299)
                                        {
                                            if ((!_303) || _299)
                                            {
                                                if ((!_307) || _299)
                                                {
                                                    if ((!_311) || _299)
                                                    {
                                                        if ((!_313) || _299)
                                                        {
                                                            _299 = false;
                                                            float _407 = -_251;
                                                            float _409 = _407 + 1.0;
                                                            float _411 = _253 * _47;
                                                            float _413 = _409 * _45;
                                                            _319 = _411;
                                                            _321 = _413;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _313) || _311) || _307) || _303)
                                            {
                                                if ((!_307) || _303)
                                                {
                                                    if ((!_311) || _303)
                                                    {
                                                        if ((!_313) || _303)
                                                        {
                                                            _303 = false;
                                                            float _415 = -_251;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_255;
                                                            float _421 = _419 + 1.0;
                                                            float _423 = fma(_251, _45, _417);
                                                            float _425 = _421 * _47;
                                                            _319 = _425;
                                                            _321 = _423;
                                                        }
                                                    }
                                                }
                                                if (((false || _313) || _311) || _307)
                                                {
                                                    if ((!_311) || _307)
                                                    {
                                                        if ((!_313) || _307)
                                                        {
                                                            _307 = false;
                                                            float _427 = -_253;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = _249 * _45;
                                                            float _433 = fma(_429, _47, _253);
                                                            _319 = _433;
                                                            _321 = _431;
                                                        }
                                                    }
                                                    if ((false || _313) || _311)
                                                    {
                                                        if ((!_313) || _311)
                                                        {
                                                            _311 = false;
                                                            float _435 = -_249;
                                                            float _437 = _435 + 1.0;
                                                            float _439 = -_255;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = fma(_437, _45, _249);
                                                            float _445 = fma(_255, _47, _441);
                                                            _319 = _445;
                                                            _321 = _443;
                                                        }
                                                        if (false || _313)
                                                        {
                                                            _313 = false;
                                                            bool _447 = _227 != 12;
                                                            if (!_447)
                                                            {
                                                                float _449 = -_253;
                                                                float _451 = _449 + 1.0;
                                                                _261 = _451;
                                                            }
                                                            float _453 = _261;
                                                            if (!_447)
                                                            {
                                                                float _455 = -_251;
                                                                float _457 = _455 + 1.0;
                                                                _263 = _457;
                                                            }
                                                            float _459 = _263;
                                                            if (_447)
                                                            {
                                                                _265 = 0.0;
                                                            }
                                                            float _461 = _265;
                                                            float _463 = _461;
                                                            if (!_447)
                                                            {
                                                                float _465 = -_255;
                                                                float _467 = _465 + _453;
                                                                _267 = _467;
                                                            }
                                                            float _469 = _267;
                                                            if (_447)
                                                            {
                                                                _231 = 0.0;
                                                            }
                                                            float _471 = _231;
                                                            _319 = _471;
                                                            if (!_447)
                                                            {
                                                                float _473 = _45 * _459;
                                                                _463 = _473;
                                                            }
                                                            float _475 = _463;
                                                            _321 = _475;
                                                            if (!_447)
                                                            {
                                                                float _477 = _47 * _469;
                                                                _319 = _477;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _479 = _319;
            float _481 = _321;
            float _483 = -_479;
            float _485 = _483 + 1.0;
            float _487 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _489 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _491 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _493 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _495 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _497 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _499 = _479 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _501 = _479 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _503 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].x, _487);
            float _505 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].x, _489);
            float _507 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].y, _491);
            float _509 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].y, _493);
            float _511 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].z, _495);
            float _513 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].z, _497);
            float _515 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[29].w, _499);
            float _517 = fma(_485, (*spvDescriptorSet0.vp_c3)._m0[30].w, _501);
            float _519 = -_481;
            float _521 = _519 + 1.0;
            float _523 = _503 * _481;
            float _525 = _507 * _481;
            float _527 = _511 * _481;
            float _529 = _517 * _481;
            float _531 = fma(_521, _505, _523);
            float _533 = fma(_521, _509, _525);
            float _535 = fma(_521, _513, _527);
            float _537 = fma(_521, _515, _529);
            _144 = _45;
            _148 = _47;
            _152 = _531;
            _156 = _533;
            _160 = _535;
            _164 = _537;
            _166 = true;
        }
        else
        {
            float _539 = trunc(_45);
            int _541 = int(_539);
            float _543 = trunc(_47);
            int _545 = int(_543);
            int _547 = _545 << 1;
            int _549 = _547 + _541;
            int _551 = _549 << 4;
            bool _553 = _551 == 0;
            bool _555 = _551 == 16;
            bool _557 = _551 == 32;
            bool _559 = _551 == 48;
            if (_553)
            {
                _126 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _561 = _126;
            float _563 = _561;
            if (_553)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _565 = _128;
            bool _567 = _227 != 13;
            float _569 = _565;
            if (_555)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _571 = _563;
            float _573 = _571;
            if (_555)
            {
                _569 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _575 = _569;
            float _577 = _575;
            if (_557)
            {
                _573 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _579 = _573;
            float _581 = _579;
            if (_557)
            {
                _577 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _583 = _577;
            float _585 = _583;
            if (_559)
            {
                _581 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _587 = _581;
            _144 = _587;
            if (_559)
            {
                _585 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _589 = _585;
            if (!_567)
            {
                float _591 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _593 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _595 = _591 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _597 = -_595;
                float _599 = _597 + 1.0;
                float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _603 = -_591;
                float _605 = fma(_603, (*spvDescriptorSet0.vp_c3)._m0[26].w, _599);
                float _607 = -_601;
                float _609 = _607 + 1.0;
                float _611 = fma(_605, _47, _595);
                float _613 = -_593;
                float _615 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[26].y, _609);
                float _617 = -_611;
                float _619 = _617 + 1.0;
                float _621 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _623 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _625 = fma(_615, _45, _601);
                float _627 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _629 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _631 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _633 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _635 = _611 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _637 = _611 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _639 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].x, _621);
                float _641 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].y, _623);
                float _643 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].z, _631);
                float _645 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[30].w, _637);
                float _647 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].x, _627);
                float _649 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].y, _629);
                float _651 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].z, _633);
                float _653 = fma(_619, (*spvDescriptorSet0.vp_c3)._m0[29].w, _635);
                float _655 = -_625;
                float _657 = _655 + 1.0;
                float _659 = _625 * _639;
                float _661 = _625 * _641;
                float _663 = _625 * _643;
                float _665 = _625 * _645;
                float _667 = fma(_657, _647, _659);
                float _669 = fma(_657, _649, _661);
                float _671 = fma(_657, _651, _663);
                float _673 = fma(_657, _653, _665);
                _148 = _589;
                _152 = _667;
                _156 = _669;
                _160 = _671;
                _164 = _673;
                _166 = true;
            }
            else
            {
                int _675 = _549 << 4;
                int _677 = _675 + 464;
                uint _679 = uint(int(uint(_677) >> uint(2)));
                uint _681 = uint(int(uint(int(_679)) >> uint(2)));
                int _683 = int(_679) & 3;
                float _685 = (*spvDescriptorSet0.vp_c3)._m0[int(_681)][_683];
                int _687 = int(_679) + 1;
                uint _689 = uint(int(uint(_687) >> uint(2)));
                int _691 = _687 & 3;
                float _693 = (*spvDescriptorSet0.vp_c3)._m0[int(_689)][_691];
                int _695 = _677 + 8;
                uint _697 = uint(int(uint(_695) >> uint(2)));
                uint _699 = uint(int(uint(int(_697)) >> uint(2)));
                int _701 = int(_697) & 3;
                float _703 = (*spvDescriptorSet0.vp_c3)._m0[int(_699)][_701];
                int _705 = int(_697) + 1;
                uint _707 = uint(int(uint(_705) >> uint(2)));
                int _709 = _705 & 3;
                float _711 = (*spvDescriptorSet0.vp_c3)._m0[int(_707)][_709];
                _148 = _589;
                _152 = _685;
                _156 = _693;
                _160 = _703;
                _164 = _711;
            }
        }
    }
    _166 = false;
    float _713 = _144;
    float _715 = _148;
    bool _717 = _138;
    float _719 = _152;
    float _721 = _156;
    float _723 = _160;
    float _725 = _164;
    bool _727 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _729 = !_727;
    float _731 = _713;
    float _733 = _715;
    float _747;
    float _749;
    if (!_729)
    {
        float _735 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _737 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _739 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _735);
        float _741 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _737);
        float _743 = _739 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _745 = _741 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _747 = _745;
        _749 = _743;
        _751 = true;
    }
    else
    {
        int _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _755 = _753 != 0;
        if (!_755)
        {
            _130 = _713;
        }
        float _757 = _130;
        float _759 = _757;
        _749 = _757;
        if (!_755)
        {
            _132 = _715;
        }
        float _761 = _132;
        bool _763 = !_755;
        float _765 = _761;
        _747 = _761;
        if (!_763)
        {
            if (!_717)
            {
                _759 = _713;
            }
            float _767 = _759;
            float _769 = _767;
            int _771 = as_type<int>(_767);
            if (!_717)
            {
                _765 = _715;
            }
            float _773 = _765;
            bool _775 = !_717;
            float _777 = _773;
            float _779 = _773;
            if (!_775)
            {
                int _781 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _783 = _781 != 0;
                int _785 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _787 = _785 != 0;
                int _789 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _791 = _789 != 0;
                int _793 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _795 = _793 != 0;
                int _797 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _799 = _797 != 0;
                if (_783)
                {
                    _769 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _801 = _769;
                float _803 = _801;
                if (_783)
                {
                    _777 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _805 = _777;
                float _807 = _805;
                if (!_783)
                {
                    _803 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _809 = _803;
                if (!_783)
                {
                    _807 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _811 = _807;
                float _813 = _809 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _815 = _811 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_795)
                {
                    float _817 = _813 * _713;
                    _731 = _817;
                }
                float _819 = _731;
                float _821 = -_813;
                float _823 = _821 + 1.0;
                int _825 = as_type<int>(_819);
                if (_799)
                {
                    float _827 = _815 * _715;
                    _733 = _827;
                }
                float _829 = _733;
                float _831 = -_815;
                float _833 = _831 + 1.0;
                float _835 = _829;
                if (_787)
                {
                    float _837 = _819 + _823;
                    _825 = as_type<int>(_837);
                }
                int _839 = _825;
                if (_791)
                {
                    float _841 = _829 + _833;
                    _835 = _841;
                }
                float _843 = _835;
                _771 = _839;
                _779 = _843;
            }
            int _845 = _771;
            float _847 = _779;
            int _849 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _851 = _849 != 0;
            int _853 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _855 = _853 != 0;
            int _857 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _859 = _857 != 0;
            int _861 = _845;
            int _863 = as_type<int>(_847);
            if (_855)
            {
                float _865 = -as_type<float>(_845);
                float _867 = _865 + 1.0;
                _861 = as_type<int>(_867);
            }
            int _869 = _861;
            if (_859)
            {
                float _871 = -_847;
                float _873 = _871 + 1.0;
                _863 = as_type<int>(_873);
            }
            int _875 = _863;
            bool _877 = !_851;
            float _879 = _877 ? as_type<float>(_869) : as_type<float>(_875);
            bool _881 = !_851;
            float _883 = _881 ? as_type<float>(_875) : as_type<float>(_869);
            _747 = _883;
            _749 = _879;
        }
    }
    _751 = false;
    float _885 = _747;
    float _887 = _749;
    float _889 = _885 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _891 = _885 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _893 = _719 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _895 = _721 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c3)._m0[8].x, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c3)._m0[7].x, _891);
    float _901 = _723 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _903 = _725 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _905 = _897 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _907 = _899 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    out.m_27.x = _45;
    out.m_27.y = _47;
    float _909 = -_905;
    float _911 = _909 + 1.0;
    out.m_29.x = _893;
    out.m_29.y = _895;
    out.m_29.z = _901;
    out.m_29.w = _903;
    out.m_31.x = _907;
    out.m_31.y = _911;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


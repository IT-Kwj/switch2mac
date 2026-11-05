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
    constant _16* vp_c3 [[id(0)]];
    constant _16* vp_c1 [[id(1)]];
};

struct main0_out
{
    float4 m_29 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _805 = false;
    bool _172 = false;
    bool _317 = false;
    bool _315 = false;
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
    float _114 = _97;
    float _116 = _99;
    float _118 = _67;
    float _120 = _91;
    float _122 = _101;
    float _124 = _103;
    float _126 = _47;
    float _128 = _45;
    bool _134;
    float _138;
    float _144;
    float _150;
    float _154;
    float _158;
    float _162;
    float _166;
    float _170;
    if (!_112)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _114 = 255.0;
        }
        float _136 = _114;
        _138 = _136;
        if (_132)
        {
            _116 = 255.0;
        }
        float _140 = _116;
        float _142 = 0.0;
        _144 = _140;
        if (_132)
        {
            _142 = 255.0;
        }
        float _146 = _142;
        float _148 = 0.0;
        _150 = _146;
        if (_132)
        {
            _148 = 255.0;
        }
        float _152 = _148;
        _154 = _152;
        if (_132)
        {
            _118 = _45;
        }
        float _156 = _118;
        _158 = _156;
        if (_132)
        {
            _120 = _47;
        }
        float _160 = _120;
        _162 = _160;
        if (_132)
        {
            _122 = _45;
        }
        float _164 = _122;
        _166 = _164;
        if (_132)
        {
            _124 = _47;
        }
        float _168 = _124;
        _170 = _168;
        _172 = _132;
        if (!_172)
        {
            float _174 = trunc(_45);
            int _176 = int(_174);
            float _178 = trunc(_47);
            int _180 = int(_178);
            int _182 = _180 << 1;
            int _184 = _182 + _176;
            int _186 = _184 << 4;
            int _188 = _186 + 224;
            uint _191 = uint(int(uint(_188) >> uint(2)));
            uint _193 = uint(int(uint(int(_191)) >> uint(2)));
            int _195 = int(_191) & 3;
            float _197 = (*spvDescriptorSet0.vp_c3)._m0[int(_193)][_195];
            int _199 = int(_191) + 1;
            uint _201 = uint(int(uint(_199) >> uint(2)));
            int _203 = _199 & 3;
            float _205 = (*spvDescriptorSet0.vp_c3)._m0[int(_201)][_203];
            int _207 = _186 + 288;
            uint _209 = uint(int(uint(_207) >> uint(2)));
            uint _211 = uint(int(uint(int(_209)) >> uint(2)));
            int _213 = int(_209) & 3;
            float _215 = (*spvDescriptorSet0.vp_c3)._m0[int(_211)][_213];
            int _217 = int(_209) + 1;
            uint _219 = uint(int(uint(_217) >> uint(2)));
            int _221 = _217 & 3;
            float _223 = (*spvDescriptorSet0.vp_c3)._m0[int(_219)][_221];
            _158 = _197;
            _162 = _205;
            _126 = as_type<float>(_180);
            _128 = as_type<float>(_176);
            _166 = _215;
            _170 = _223;
            _138 = 255.0;
            _144 = 255.0;
            _150 = 255.0;
            _154 = 255.0;
            _172 = true;
        }
    }
    else
    {
        int _225 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _227 = _225 != 0;
        uint _229 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _231 = int(_229) & 15;
        bool _233 = !_227;
        float _235 = as_type<float>(_231);
        _134 = _227;
        if (!_233)
        {
            uint _237 = min(uint(_231), 13u);
            float _239 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _241 = int(_237) << 2;
            uint _243 = uint(int(uint(_241) >> uint(2)));
            uint _245 = uint(int(uint(int(_243)) >> uint(2)));
            int _247 = int(_243) & 3;
            float _249 = (*spvDescriptorSet0.vp_c1)._m0[int(_245)][_247];
            float _251 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _253 = _239 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _255 = _239 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _257 = _251 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _259 = _251 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _261 = as_type<int>(_249) >> 31;
            bool _263 = as_type<int>(_249) == 1120;
            float _265 = as_type<float>(_261);
            float _267 = _255;
            float _269 = _249;
            float _271 = _259;
            if (!_263)
            {
                bool _273 = as_type<int>(_249) == 1168;
                _275 = _273;
                if (!_275)
                {
                    bool _277 = as_type<int>(_249) == 1232;
                    _279 = _277;
                    if (!_279)
                    {
                        bool _281 = as_type<int>(_249) == 1296;
                        _283 = _281;
                        if (!_283)
                        {
                            bool _285 = as_type<int>(_249) == 1376;
                            _287 = _285;
                            if (!_287)
                            {
                                bool _289 = as_type<int>(_249) == 1456;
                                _291 = _289;
                                if (!_291)
                                {
                                    bool _293 = as_type<int>(_249) == 1552;
                                    _295 = _293;
                                    if (!_295)
                                    {
                                        bool _297 = as_type<int>(_249) == 1632;
                                        _299 = _297;
                                        if (!_299)
                                        {
                                            bool _301 = as_type<int>(_249) == 1728;
                                            _303 = _301;
                                            if (!_303)
                                            {
                                                bool _305 = as_type<int>(_249) == 1792;
                                                _307 = _305;
                                                if (!_307)
                                                {
                                                    bool _309 = as_type<int>(_249) == 1872;
                                                    _311 = _309;
                                                    if (!_311)
                                                    {
                                                        bool _313 = as_type<int>(_249) == 1936;
                                                        _315 = _313;
                                                        if (!_315)
                                                        {
                                                            _317 = true;
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
            float _323;
            float _325;
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
                                                    if (!_315)
                                                    {
                                                        if (!_317)
                                                        {
                                                            float _319 = _253 * _45;
                                                            float _321 = _257 * _47;
                                                            _323 = _321;
                                                            _325 = _319;
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
            if ((((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275)
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
                                                    if ((!_315) || _275)
                                                    {
                                                        if ((!_317) || _275)
                                                        {
                                                            _275 = false;
                                                            float _327 = -_255;
                                                            float _329 = _327 + 1.0;
                                                            float _331 = _257 * _47;
                                                            float _333 = fma(_255, _45, _329);
                                                            _323 = _331;
                                                            _325 = _333;
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
                if (((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279)
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
                                                    if ((!_315) || _279)
                                                    {
                                                        if ((!_317) || _279)
                                                        {
                                                            _279 = false;
                                                            float _335 = -_259;
                                                            float _337 = _335 + 1.0;
                                                            float _339 = _253 * _45;
                                                            float _341 = fma(_259, _47, _337);
                                                            _323 = _341;
                                                            _325 = _339;
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
                    if ((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283)
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
                                                    if ((!_315) || _283)
                                                    {
                                                        if ((!_317) || _283)
                                                        {
                                                            _283 = false;
                                                            float _343 = -_255;
                                                            float _345 = _343 + 1.0;
                                                            float _347 = -_259;
                                                            float _349 = _347 + 1.0;
                                                            float _351 = fma(_255, _45, _345);
                                                            float _353 = fma(_259, _47, _349);
                                                            _323 = _353;
                                                            _325 = _351;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287)
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
                                                    if ((!_315) || _287)
                                                    {
                                                        if ((!_317) || _287)
                                                        {
                                                            _287 = false;
                                                            float _355 = -_257;
                                                            float _357 = _355 + 1.0;
                                                            float _359 = _253 * _45;
                                                            float _361 = -_259;
                                                            float _363 = _361 + _357;
                                                            float _365 = fma(_363, _47, _257);
                                                            _323 = _365;
                                                            _325 = _359;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291)
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
                                                    if ((!_315) || _291)
                                                    {
                                                        if ((!_317) || _291)
                                                        {
                                                            _291 = false;
                                                            float _367 = -_257;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_255;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = -_259;
                                                            float _377 = _375 + _369;
                                                            float _379 = fma(_255, _45, _373);
                                                            float _381 = fma(_377, _47, _257);
                                                            _323 = _381;
                                                            _325 = _379;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295)
                                {
                                    if ((!_299) || _295)
                                    {
                                        if ((!_303) || _295)
                                        {
                                            if ((!_307) || _295)
                                            {
                                                if ((!_311) || _295)
                                                {
                                                    if ((!_315) || _295)
                                                    {
                                                        if ((!_317) || _295)
                                                        {
                                                            _295 = false;
                                                            float _383 = -_253;
                                                            float _385 = _383 + 1.0;
                                                            float _387 = _257 * _47;
                                                            float _389 = -_255;
                                                            float _391 = _389 + _385;
                                                            float _393 = fma(_391, _45, _253);
                                                            _323 = _387;
                                                            _325 = _393;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _317) || _315) || _311) || _307) || _303) || _299)
                                    {
                                        if ((!_303) || _299)
                                        {
                                            if ((!_307) || _299)
                                            {
                                                if ((!_311) || _299)
                                                {
                                                    if ((!_315) || _299)
                                                    {
                                                        if ((!_317) || _299)
                                                        {
                                                            _299 = false;
                                                            float _395 = -_253;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = -_259;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = -_255;
                                                            float _405 = _403 + _397;
                                                            float _407 = fma(_259, _47, _401);
                                                            float _409 = fma(_405, _45, _253);
                                                            _323 = _407;
                                                            _325 = _409;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _317) || _315) || _311) || _307) || _303)
                                        {
                                            if ((!_307) || _303)
                                            {
                                                if ((!_311) || _303)
                                                {
                                                    if ((!_315) || _303)
                                                    {
                                                        if ((!_317) || _303)
                                                        {
                                                            _303 = false;
                                                            float _411 = -_255;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = _257 * _47;
                                                            float _417 = _413 * _45;
                                                            _323 = _415;
                                                            _325 = _417;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _317) || _315) || _311) || _307)
                                            {
                                                if ((!_311) || _307)
                                                {
                                                    if ((!_315) || _307)
                                                    {
                                                        if ((!_317) || _307)
                                                        {
                                                            _307 = false;
                                                            float _419 = -_255;
                                                            float _421 = _419 + 1.0;
                                                            float _423 = -_259;
                                                            float _425 = _423 + 1.0;
                                                            float _427 = fma(_255, _45, _421);
                                                            float _429 = _425 * _47;
                                                            _323 = _429;
                                                            _325 = _427;
                                                        }
                                                    }
                                                }
                                                if (((false || _317) || _315) || _311)
                                                {
                                                    if ((!_315) || _311)
                                                    {
                                                        if ((!_317) || _311)
                                                        {
                                                            _311 = false;
                                                            float _431 = -_257;
                                                            float _433 = _431 + 1.0;
                                                            float _435 = _253 * _45;
                                                            float _437 = fma(_433, _47, _257);
                                                            _323 = _437;
                                                            _325 = _435;
                                                        }
                                                    }
                                                    if ((false || _317) || _315)
                                                    {
                                                        if ((!_317) || _315)
                                                        {
                                                            _315 = false;
                                                            float _439 = -_253;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_259;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = fma(_441, _45, _253);
                                                            float _449 = fma(_259, _47, _445);
                                                            _323 = _449;
                                                            _325 = _447;
                                                        }
                                                        if (false || _317)
                                                        {
                                                            _317 = false;
                                                            bool _451 = _231 != 12;
                                                            if (!_451)
                                                            {
                                                                float _453 = -_257;
                                                                float _455 = _453 + 1.0;
                                                                _265 = _455;
                                                            }
                                                            float _457 = _265;
                                                            if (!_451)
                                                            {
                                                                float _459 = -_255;
                                                                float _461 = _459 + 1.0;
                                                                _267 = _461;
                                                            }
                                                            float _463 = _267;
                                                            if (_451)
                                                            {
                                                                _269 = 0.0;
                                                            }
                                                            float _465 = _269;
                                                            float _467 = _465;
                                                            if (!_451)
                                                            {
                                                                float _469 = -_259;
                                                                float _471 = _469 + _457;
                                                                _271 = _471;
                                                            }
                                                            float _473 = _271;
                                                            if (_451)
                                                            {
                                                                _235 = 0.0;
                                                            }
                                                            float _475 = _235;
                                                            _323 = _475;
                                                            if (!_451)
                                                            {
                                                                float _477 = _45 * _463;
                                                                _467 = _477;
                                                            }
                                                            float _479 = _467;
                                                            _325 = _479;
                                                            if (!_451)
                                                            {
                                                                float _481 = _47 * _473;
                                                                _323 = _481;
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
            float _483 = _323;
            float _485 = _325;
            float _487 = -_483;
            float _489 = _487 + 1.0;
            float _491 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _493 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _495 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _497 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _499 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _501 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _503 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _505 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _507 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].x, _491);
            float _509 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].x, _493);
            float _511 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].y, _495);
            float _513 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].y, _497);
            float _515 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].z, _499);
            float _517 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].z, _501);
            float _519 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].w, _503);
            float _521 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].w, _505);
            float _523 = -_485;
            float _525 = _523 + 1.0;
            float _527 = _507 * _485;
            float _529 = _511 * _485;
            float _531 = _515 * _485;
            float _533 = _521 * _485;
            float _535 = fma(_525, _509, _527);
            float _537 = fma(_525, _513, _529);
            float _539 = fma(_525, _517, _531);
            float _541 = fma(_525, _519, _533);
            _158 = _45;
            _162 = _47;
            _166 = _45;
            _170 = _47;
            _138 = _535;
            _144 = _537;
            _150 = _539;
            _154 = _541;
            _172 = true;
        }
        else
        {
            float _543 = trunc(_45);
            int _545 = int(_543);
            bool _547 = _231 != 13;
            float _549 = trunc(_47);
            int _551 = int(_549);
            int _553 = _551 << 1;
            int _555 = _553 + _545;
            int _557 = _555 << 4;
            if (!_547)
            {
                float _559 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                int _561 = _557 + 224;
                uint _563 = uint(int(uint(_561) >> uint(2)));
                uint _565 = uint(int(uint(int(_563)) >> uint(2)));
                int _567 = int(_563) & 3;
                float _569 = (*spvDescriptorSet0.vp_c3)._m0[int(_565)][_567];
                int _571 = int(_563) + 1;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                int _575 = _571 & 3;
                float _577 = (*spvDescriptorSet0.vp_c3)._m0[int(_573)][_575];
                float _579 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                int _581 = _557 + 288;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                uint _585 = uint(int(uint(int(_583)) >> uint(2)));
                int _587 = int(_583) & 3;
                float _589 = (*spvDescriptorSet0.vp_c3)._m0[int(_585)][_587];
                int _591 = int(_583) + 1;
                uint _593 = uint(int(uint(_591) >> uint(2)));
                int _595 = _591 & 3;
                float _597 = (*spvDescriptorSet0.vp_c3)._m0[int(_593)][_595];
                float _599 = _559 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _601 = -_599;
                float _603 = _601 + 1.0;
                float _605 = _579 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _607 = -_559;
                float _609 = fma(_607, (*spvDescriptorSet0.vp_c3)._m0[26].w, _603);
                float _611 = -_605;
                float _613 = _611 + 1.0;
                float _615 = fma(_609, _47, _599);
                float _617 = -_579;
                float _619 = fma(_617, (*spvDescriptorSet0.vp_c3)._m0[26].y, _613);
                float _621 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _623 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _625 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _627 = fma(_619, _45, _605);
                float _629 = -_615;
                float _631 = _629 + 1.0;
                float _633 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _635 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _637 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _639 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _641 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _643 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].y, _621);
                float _645 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].x, _623);
                float _647 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].x, _625);
                float _649 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].y, _633);
                float _651 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].z, _635);
                float _653 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].z, _637);
                float _655 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].w, _639);
                float _657 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].w, _641);
                float _659 = -_627;
                float _661 = _659 + 1.0;
                float _663 = _627 * _643;
                float _665 = _627 * _645;
                float _667 = _627 * _651;
                float _669 = _627 * _657;
                float _671 = fma(_661, _649, _663);
                float _673 = fma(_661, _647, _665);
                float _675 = fma(_661, _653, _667);
                float _677 = fma(_661, _655, _669);
                _158 = _569;
                _162 = _577;
                _126 = _667;
                _128 = _657;
                _166 = _589;
                _170 = _597;
                _138 = _673;
                _144 = _671;
                _150 = _675;
                _154 = _677;
                _172 = true;
            }
            else
            {
                int _679 = _557 + 464;
                uint _681 = uint(int(uint(_679) >> uint(2)));
                uint _683 = uint(int(uint(int(_681)) >> uint(2)));
                int _685 = int(_681) & 3;
                float _687 = (*spvDescriptorSet0.vp_c3)._m0[int(_683)][_685];
                int _689 = int(_681) + 1;
                uint _691 = uint(int(uint(_689) >> uint(2)));
                int _693 = _689 & 3;
                float _695 = (*spvDescriptorSet0.vp_c3)._m0[int(_691)][_693];
                int _697 = _557 + 472;
                uint _699 = uint(int(uint(_697) >> uint(2)));
                uint _701 = uint(int(uint(int(_699)) >> uint(2)));
                int _703 = int(_699) & 3;
                float _705 = (*spvDescriptorSet0.vp_c3)._m0[int(_701)][_703];
                int _707 = int(_699) + 1;
                uint _709 = uint(int(uint(_707) >> uint(2)));
                int _711 = _707 & 3;
                float _713 = (*spvDescriptorSet0.vp_c3)._m0[int(_709)][_711];
                int _715 = _557 + 224;
                uint _717 = uint(int(uint(_715) >> uint(2)));
                uint _719 = uint(int(uint(int(_717)) >> uint(2)));
                int _721 = int(_717) & 3;
                float _723 = (*spvDescriptorSet0.vp_c3)._m0[int(_719)][_721];
                int _725 = int(_717) + 1;
                uint _727 = uint(int(uint(_725) >> uint(2)));
                int _729 = _725 & 3;
                float _731 = (*spvDescriptorSet0.vp_c3)._m0[int(_727)][_729];
                int _733 = _557 + 288;
                uint _735 = uint(int(uint(_733) >> uint(2)));
                uint _737 = uint(int(uint(int(_735)) >> uint(2)));
                int _739 = int(_735) & 3;
                float _741 = (*spvDescriptorSet0.vp_c3)._m0[int(_737)][_739];
                int _743 = int(_735) + 1;
                uint _745 = uint(int(uint(_743) >> uint(2)));
                int _747 = _743 & 3;
                float _749 = (*spvDescriptorSet0.vp_c3)._m0[int(_745)][_747];
                _158 = _723;
                _162 = _731;
                _166 = _741;
                _170 = _749;
                _138 = _687;
                _144 = _695;
                _150 = _705;
                _154 = _713;
            }
        }
    }
    _172 = false;
    float _751 = _158;
    float _753 = _162;
    bool _755 = _134;
    float _757 = _126;
    float _759 = _128;
    float _761 = _166;
    float _763 = _170;
    float _765 = _138;
    float _767 = _144;
    float _769 = _150;
    float _771 = _154;
    bool _773 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _775 = !_773;
    float _777 = _757;
    float _779 = _759;
    float _781 = _751;
    float _783 = _753;
    float _785 = _761;
    float _787 = _763;
    float _801;
    float _803;
    if (!_775)
    {
        float _789 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _791 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _793 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _789);
        float _795 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _791);
        float _797 = _793 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _799 = _795 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _801 = _799;
        _803 = _797;
        _805 = true;
    }
    else
    {
        int _807 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _809 = _807 != 0;
        if (!_809)
        {
            _777 = _751;
        }
        float _811 = _777;
        float _813 = _811;
        _803 = _811;
        if (!_809)
        {
            _779 = _753;
        }
        float _815 = _779;
        bool _817 = !_809;
        float _819 = _815;
        _801 = _815;
        if (!_817)
        {
            if (!_755)
            {
                _813 = _751;
            }
            float _821 = _813;
            float _823 = _821;
            int _825 = as_type<int>(_821);
            if (!_755)
            {
                _819 = _753;
            }
            float _827 = _819;
            bool _829 = !_755;
            float _831 = _827;
            float _833 = _827;
            if (!_829)
            {
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _837 = _835 != 0;
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _853 = _851 != 0;
                if (_837)
                {
                    _823 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _855 = _823;
                float _857 = _855;
                if (_837)
                {
                    _831 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _859 = _831;
                float _861 = _859;
                if (!_837)
                {
                    _857 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _857;
                if (!_837)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _865 = _861;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _869 = _865 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_849)
                {
                    float _871 = _867 * _751;
                    _781 = _871;
                }
                float _873 = _781;
                float _875 = -_867;
                float _877 = _875 + 1.0;
                int _879 = as_type<int>(_873);
                if (_853)
                {
                    float _881 = _869 * _753;
                    _783 = _881;
                }
                float _883 = _783;
                float _885 = -_869;
                float _887 = _885 + 1.0;
                float _889 = _883;
                if (_841)
                {
                    float _891 = _873 + _877;
                    _879 = as_type<int>(_891);
                }
                int _893 = _879;
                if (_845)
                {
                    float _895 = _883 + _887;
                    _889 = _895;
                }
                float _897 = _889;
                _825 = _893;
                _833 = _897;
            }
            int _899 = _825;
            float _901 = _833;
            int _903 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _905 = _903 != 0;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _913 = _911 != 0;
            int _915 = _899;
            int _917 = as_type<int>(_901);
            if (_909)
            {
                float _919 = -as_type<float>(_899);
                float _921 = _919 + 1.0;
                _915 = as_type<int>(_921);
            }
            int _923 = _915;
            if (_913)
            {
                float _925 = -_901;
                float _927 = _925 + 1.0;
                _917 = as_type<int>(_927);
            }
            int _929 = _917;
            bool _931 = !_905;
            float _933 = _931 ? as_type<float>(_923) : as_type<float>(_929);
            bool _935 = !_905;
            float _937 = _935 ? as_type<float>(_929) : as_type<float>(_923);
            _801 = _937;
            _803 = _933;
        }
    }
    _805 = false;
    float _939 = _801;
    float _941 = _803;
    float _943 = _939 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _945 = _939 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _947 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _949 = fma(_941, (*spvDescriptorSet0.vp_c3)._m0[8].x, _943);
    float _951 = fma(_941, (*spvDescriptorSet0.vp_c3)._m0[7].x, _945);
    float _953 = _949 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _955 = _951 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _957 = -_953;
    float _959 = _957 + 1.0;
    out.m_27.x = _955;
    out.m_27.y = _959;
    bool _961 = !_947;
    float _963 = _959;
    float _965 = _955;
    float _979;
    float _981;
    if (!_961)
    {
        float _967 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _969 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _971 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _967);
        float _973 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _969);
        float _975 = _971 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _977 = _973 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _979 = _977;
        _981 = _975;
        _983 = true;
    }
    else
    {
        int _985 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _987 = _985 != 0;
        if (!_987)
        {
            _963 = _761;
        }
        float _989 = _963;
        float _991 = _989;
        _981 = _989;
        if (!_987)
        {
            _965 = _763;
        }
        float _993 = _965;
        bool _995 = !_987;
        float _997 = _993;
        _979 = _993;
        if (!_995)
        {
            if (!_755)
            {
                _991 = _761;
            }
            float _999 = _991;
            float _1001 = _999;
            int _1003 = as_type<int>(_999);
            if (!_755)
            {
                _997 = _763;
            }
            float _1005 = _997;
            bool _1007 = !_755;
            float _1009 = _1005;
            float _1011 = _1005;
            if (!_1007)
            {
                int _1013 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1015 = _1013 != 0;
                int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1019 = _1017 != 0;
                int _1021 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1023 = _1021 != 0;
                int _1025 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1027 = _1025 != 0;
                int _1029 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1031 = _1029 != 0;
                if (_1015)
                {
                    _1001 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1033 = _1001;
                float _1035 = _1033;
                if (_1015)
                {
                    _1009 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1037 = _1009;
                float _1039 = _1037;
                if (!_1015)
                {
                    _1035 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1041 = _1035;
                if (!_1015)
                {
                    _1039 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1043 = _1039;
                float _1045 = _1041 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1047 = _1043 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1027)
                {
                    float _1049 = _1045 * _761;
                    _785 = _1049;
                }
                float _1051 = _785;
                float _1053 = -_1045;
                float _1055 = _1053 + 1.0;
                int _1057 = as_type<int>(_1051);
                if (_1031)
                {
                    float _1059 = _1047 * _763;
                    _787 = _1059;
                }
                float _1061 = _787;
                float _1063 = -_1047;
                float _1065 = _1063 + 1.0;
                float _1067 = _1061;
                if (_1019)
                {
                    float _1069 = _1051 + _1055;
                    _1057 = as_type<int>(_1069);
                }
                int _1071 = _1057;
                if (_1023)
                {
                    float _1073 = _1061 + _1065;
                    _1067 = _1073;
                }
                float _1075 = _1067;
                _1003 = _1071;
                _1011 = _1075;
            }
            int _1077 = _1003;
            float _1079 = _1011;
            int _1081 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1083 = _1081 != 0;
            int _1085 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1087 = _1085 != 0;
            int _1089 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1091 = _1089 != 0;
            int _1093 = _1077;
            int _1095 = as_type<int>(_1079);
            if (_1087)
            {
                float _1097 = -as_type<float>(_1077);
                float _1099 = _1097 + 1.0;
                _1093 = as_type<int>(_1099);
            }
            int _1101 = _1093;
            if (_1091)
            {
                float _1103 = -_1079;
                float _1105 = _1103 + 1.0;
                _1095 = as_type<int>(_1105);
            }
            int _1107 = _1095;
            bool _1109 = !_1083;
            float _1111 = _1109 ? as_type<float>(_1101) : as_type<float>(_1107);
            bool _1113 = !_1083;
            float _1115 = _1113 ? as_type<float>(_1107) : as_type<float>(_1101);
            _979 = _1115;
            _981 = _1111;
        }
    }
    _983 = false;
    float _1117 = _979;
    float _1119 = _981;
    float _1121 = _1117 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1125 = _765 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1127 = _767 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1121);
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1123);
    float _1133 = _769 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1135 = _771 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1141 = -_1137;
    float _1143 = _1141 + 1.0;
    out.m_29.x = _1125;
    out.m_29.y = _1127;
    out.m_29.z = _1133;
    out.m_29.w = _1135;
    out.m_31.x = _1139;
    out.m_31.y = _1143;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _805 = false;
    bool _172 = false;
    bool _317 = false;
    bool _315 = false;
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
    float _114 = _97;
    float _116 = _99;
    float _118 = _67;
    float _120 = _91;
    float _122 = _101;
    float _124 = _103;
    float _126 = _47;
    float _128 = _45;
    bool _134;
    float _138;
    float _144;
    float _150;
    float _154;
    float _158;
    float _162;
    float _166;
    float _170;
    if (!_112)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _114 = 255.0;
        }
        float _136 = _114;
        _138 = _136;
        if (_132)
        {
            _116 = 255.0;
        }
        float _140 = _116;
        float _142 = 0.0;
        _144 = _140;
        if (_132)
        {
            _142 = 255.0;
        }
        float _146 = _142;
        float _148 = 0.0;
        _150 = _146;
        if (_132)
        {
            _148 = 255.0;
        }
        float _152 = _148;
        _154 = _152;
        if (_132)
        {
            _118 = _45;
        }
        float _156 = _118;
        _158 = _156;
        if (_132)
        {
            _120 = _47;
        }
        float _160 = _120;
        _162 = _160;
        if (_132)
        {
            _122 = _45;
        }
        float _164 = _122;
        _166 = _164;
        if (_132)
        {
            _124 = _47;
        }
        float _168 = _124;
        _170 = _168;
        _172 = _132;
        if (!_172)
        {
            float _174 = trunc(_45);
            int _176 = int(_174);
            float _178 = trunc(_47);
            int _180 = int(_178);
            int _182 = _180 << 1;
            int _184 = _182 + _176;
            int _186 = _184 << 4;
            int _188 = _186 + 224;
            uint _191 = uint(int(uint(_188) >> uint(2)));
            uint _193 = uint(int(uint(int(_191)) >> uint(2)));
            int _195 = int(_191) & 3;
            float _197 = (*spvDescriptorSet0.vp_c3)._m0[int(_193)][_195];
            int _199 = int(_191) + 1;
            uint _201 = uint(int(uint(_199) >> uint(2)));
            int _203 = _199 & 3;
            float _205 = (*spvDescriptorSet0.vp_c3)._m0[int(_201)][_203];
            int _207 = _186 + 288;
            uint _209 = uint(int(uint(_207) >> uint(2)));
            uint _211 = uint(int(uint(int(_209)) >> uint(2)));
            int _213 = int(_209) & 3;
            float _215 = (*spvDescriptorSet0.vp_c3)._m0[int(_211)][_213];
            int _217 = int(_209) + 1;
            uint _219 = uint(int(uint(_217) >> uint(2)));
            int _221 = _217 & 3;
            float _223 = (*spvDescriptorSet0.vp_c3)._m0[int(_219)][_221];
            _158 = _197;
            _162 = _205;
            _126 = as_type<float>(_180);
            _128 = as_type<float>(_176);
            _166 = _215;
            _170 = _223;
            _138 = 255.0;
            _144 = 255.0;
            _150 = 255.0;
            _154 = 255.0;
            _172 = true;
        }
    }
    else
    {
        int _225 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _227 = _225 != 0;
        uint _229 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _231 = int(_229) & 15;
        bool _233 = !_227;
        float _235 = as_type<float>(_231);
        _134 = _227;
        if (!_233)
        {
            uint _237 = min(uint(_231), 13u);
            float _239 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _241 = int(_237) << 2;
            uint _243 = uint(int(uint(_241) >> uint(2)));
            uint _245 = uint(int(uint(int(_243)) >> uint(2)));
            int _247 = int(_243) & 3;
            float _249 = (*spvDescriptorSet0.vp_c1)._m0[int(_245)][_247];
            float _251 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _253 = _239 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _255 = _239 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _257 = _251 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _259 = _251 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _261 = as_type<int>(_249) >> 31;
            bool _263 = as_type<int>(_249) == 1120;
            float _265 = as_type<float>(_261);
            float _267 = _255;
            float _269 = _249;
            float _271 = _259;
            if (!_263)
            {
                bool _273 = as_type<int>(_249) == 1168;
                _275 = _273;
                if (!_275)
                {
                    bool _277 = as_type<int>(_249) == 1232;
                    _279 = _277;
                    if (!_279)
                    {
                        bool _281 = as_type<int>(_249) == 1296;
                        _283 = _281;
                        if (!_283)
                        {
                            bool _285 = as_type<int>(_249) == 1376;
                            _287 = _285;
                            if (!_287)
                            {
                                bool _289 = as_type<int>(_249) == 1456;
                                _291 = _289;
                                if (!_291)
                                {
                                    bool _293 = as_type<int>(_249) == 1552;
                                    _295 = _293;
                                    if (!_295)
                                    {
                                        bool _297 = as_type<int>(_249) == 1632;
                                        _299 = _297;
                                        if (!_299)
                                        {
                                            bool _301 = as_type<int>(_249) == 1728;
                                            _303 = _301;
                                            if (!_303)
                                            {
                                                bool _305 = as_type<int>(_249) == 1792;
                                                _307 = _305;
                                                if (!_307)
                                                {
                                                    bool _309 = as_type<int>(_249) == 1872;
                                                    _311 = _309;
                                                    if (!_311)
                                                    {
                                                        bool _313 = as_type<int>(_249) == 1936;
                                                        _315 = _313;
                                                        if (!_315)
                                                        {
                                                            _317 = true;
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
            float _323;
            float _325;
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
                                                    if (!_315)
                                                    {
                                                        if (!_317)
                                                        {
                                                            float _319 = _253 * _45;
                                                            float _321 = _257 * _47;
                                                            _323 = _321;
                                                            _325 = _319;
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
            if ((((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275)
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
                                                    if ((!_315) || _275)
                                                    {
                                                        if ((!_317) || _275)
                                                        {
                                                            _275 = false;
                                                            float _327 = -_255;
                                                            float _329 = _327 + 1.0;
                                                            float _331 = _257 * _47;
                                                            float _333 = fma(_255, _45, _329);
                                                            _323 = _331;
                                                            _325 = _333;
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
                if (((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279)
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
                                                    if ((!_315) || _279)
                                                    {
                                                        if ((!_317) || _279)
                                                        {
                                                            _279 = false;
                                                            float _335 = -_259;
                                                            float _337 = _335 + 1.0;
                                                            float _339 = _253 * _45;
                                                            float _341 = fma(_259, _47, _337);
                                                            _323 = _341;
                                                            _325 = _339;
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
                    if ((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283)
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
                                                    if ((!_315) || _283)
                                                    {
                                                        if ((!_317) || _283)
                                                        {
                                                            _283 = false;
                                                            float _343 = -_255;
                                                            float _345 = _343 + 1.0;
                                                            float _347 = -_259;
                                                            float _349 = _347 + 1.0;
                                                            float _351 = fma(_255, _45, _345);
                                                            float _353 = fma(_259, _47, _349);
                                                            _323 = _353;
                                                            _325 = _351;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287)
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
                                                    if ((!_315) || _287)
                                                    {
                                                        if ((!_317) || _287)
                                                        {
                                                            _287 = false;
                                                            float _355 = -_257;
                                                            float _357 = _355 + 1.0;
                                                            float _359 = _253 * _45;
                                                            float _361 = -_259;
                                                            float _363 = _361 + _357;
                                                            float _365 = fma(_363, _47, _257);
                                                            _323 = _365;
                                                            _325 = _359;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291)
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
                                                    if ((!_315) || _291)
                                                    {
                                                        if ((!_317) || _291)
                                                        {
                                                            _291 = false;
                                                            float _367 = -_257;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_255;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = -_259;
                                                            float _377 = _375 + _369;
                                                            float _379 = fma(_255, _45, _373);
                                                            float _381 = fma(_377, _47, _257);
                                                            _323 = _381;
                                                            _325 = _379;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295)
                                {
                                    if ((!_299) || _295)
                                    {
                                        if ((!_303) || _295)
                                        {
                                            if ((!_307) || _295)
                                            {
                                                if ((!_311) || _295)
                                                {
                                                    if ((!_315) || _295)
                                                    {
                                                        if ((!_317) || _295)
                                                        {
                                                            _295 = false;
                                                            float _383 = -_253;
                                                            float _385 = _383 + 1.0;
                                                            float _387 = _257 * _47;
                                                            float _389 = -_255;
                                                            float _391 = _389 + _385;
                                                            float _393 = fma(_391, _45, _253);
                                                            _323 = _387;
                                                            _325 = _393;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _317) || _315) || _311) || _307) || _303) || _299)
                                    {
                                        if ((!_303) || _299)
                                        {
                                            if ((!_307) || _299)
                                            {
                                                if ((!_311) || _299)
                                                {
                                                    if ((!_315) || _299)
                                                    {
                                                        if ((!_317) || _299)
                                                        {
                                                            _299 = false;
                                                            float _395 = -_253;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = -_259;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = -_255;
                                                            float _405 = _403 + _397;
                                                            float _407 = fma(_259, _47, _401);
                                                            float _409 = fma(_405, _45, _253);
                                                            _323 = _407;
                                                            _325 = _409;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _317) || _315) || _311) || _307) || _303)
                                        {
                                            if ((!_307) || _303)
                                            {
                                                if ((!_311) || _303)
                                                {
                                                    if ((!_315) || _303)
                                                    {
                                                        if ((!_317) || _303)
                                                        {
                                                            _303 = false;
                                                            float _411 = -_255;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = _257 * _47;
                                                            float _417 = _413 * _45;
                                                            _323 = _415;
                                                            _325 = _417;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _317) || _315) || _311) || _307)
                                            {
                                                if ((!_311) || _307)
                                                {
                                                    if ((!_315) || _307)
                                                    {
                                                        if ((!_317) || _307)
                                                        {
                                                            _307 = false;
                                                            float _419 = -_255;
                                                            float _421 = _419 + 1.0;
                                                            float _423 = -_259;
                                                            float _425 = _423 + 1.0;
                                                            float _427 = fma(_255, _45, _421);
                                                            float _429 = _425 * _47;
                                                            _323 = _429;
                                                            _325 = _427;
                                                        }
                                                    }
                                                }
                                                if (((false || _317) || _315) || _311)
                                                {
                                                    if ((!_315) || _311)
                                                    {
                                                        if ((!_317) || _311)
                                                        {
                                                            _311 = false;
                                                            float _431 = -_257;
                                                            float _433 = _431 + 1.0;
                                                            float _435 = _253 * _45;
                                                            float _437 = fma(_433, _47, _257);
                                                            _323 = _437;
                                                            _325 = _435;
                                                        }
                                                    }
                                                    if ((false || _317) || _315)
                                                    {
                                                        if ((!_317) || _315)
                                                        {
                                                            _315 = false;
                                                            float _439 = -_253;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_259;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = fma(_441, _45, _253);
                                                            float _449 = fma(_259, _47, _445);
                                                            _323 = _449;
                                                            _325 = _447;
                                                        }
                                                        if (false || _317)
                                                        {
                                                            _317 = false;
                                                            bool _451 = _231 != 12;
                                                            if (!_451)
                                                            {
                                                                float _453 = -_257;
                                                                float _455 = _453 + 1.0;
                                                                _265 = _455;
                                                            }
                                                            float _457 = _265;
                                                            if (!_451)
                                                            {
                                                                float _459 = -_255;
                                                                float _461 = _459 + 1.0;
                                                                _267 = _461;
                                                            }
                                                            float _463 = _267;
                                                            if (_451)
                                                            {
                                                                _269 = 0.0;
                                                            }
                                                            float _465 = _269;
                                                            float _467 = _465;
                                                            if (!_451)
                                                            {
                                                                float _469 = -_259;
                                                                float _471 = _469 + _457;
                                                                _271 = _471;
                                                            }
                                                            float _473 = _271;
                                                            if (_451)
                                                            {
                                                                _235 = 0.0;
                                                            }
                                                            float _475 = _235;
                                                            _323 = _475;
                                                            if (!_451)
                                                            {
                                                                float _477 = _45 * _463;
                                                                _467 = _477;
                                                            }
                                                            float _479 = _467;
                                                            _325 = _479;
                                                            if (!_451)
                                                            {
                                                                float _481 = _47 * _473;
                                                                _323 = _481;
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
            float _483 = _323;
            float _485 = _325;
            float _487 = -_483;
            float _489 = _487 + 1.0;
            float _491 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _493 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _495 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _497 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _499 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _501 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _503 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _505 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _507 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].x, _491);
            float _509 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].x, _493);
            float _511 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].y, _495);
            float _513 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].y, _497);
            float _515 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].z, _499);
            float _517 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].z, _501);
            float _519 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].w, _503);
            float _521 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].w, _505);
            float _523 = -_485;
            float _525 = _523 + 1.0;
            float _527 = _507 * _485;
            float _529 = _511 * _485;
            float _531 = _515 * _485;
            float _533 = _521 * _485;
            float _535 = fma(_525, _509, _527);
            float _537 = fma(_525, _513, _529);
            float _539 = fma(_525, _517, _531);
            float _541 = fma(_525, _519, _533);
            _158 = _45;
            _162 = _47;
            _166 = _45;
            _170 = _47;
            _138 = _535;
            _144 = _537;
            _150 = _539;
            _154 = _541;
            _172 = true;
        }
        else
        {
            float _543 = trunc(_45);
            int _545 = int(_543);
            bool _547 = _231 != 13;
            float _549 = trunc(_47);
            int _551 = int(_549);
            int _553 = _551 << 1;
            int _555 = _553 + _545;
            int _557 = _555 << 4;
            if (!_547)
            {
                float _559 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                int _561 = _557 + 224;
                uint _563 = uint(int(uint(_561) >> uint(2)));
                uint _565 = uint(int(uint(int(_563)) >> uint(2)));
                int _567 = int(_563) & 3;
                float _569 = (*spvDescriptorSet0.vp_c3)._m0[int(_565)][_567];
                int _571 = int(_563) + 1;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                int _575 = _571 & 3;
                float _577 = (*spvDescriptorSet0.vp_c3)._m0[int(_573)][_575];
                float _579 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                int _581 = _557 + 288;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                uint _585 = uint(int(uint(int(_583)) >> uint(2)));
                int _587 = int(_583) & 3;
                float _589 = (*spvDescriptorSet0.vp_c3)._m0[int(_585)][_587];
                int _591 = int(_583) + 1;
                uint _593 = uint(int(uint(_591) >> uint(2)));
                int _595 = _591 & 3;
                float _597 = (*spvDescriptorSet0.vp_c3)._m0[int(_593)][_595];
                float _599 = _559 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _601 = -_599;
                float _603 = _601 + 1.0;
                float _605 = _579 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _607 = -_559;
                float _609 = fma(_607, (*spvDescriptorSet0.vp_c3)._m0[26].w, _603);
                float _611 = -_605;
                float _613 = _611 + 1.0;
                float _615 = fma(_609, _47, _599);
                float _617 = -_579;
                float _619 = fma(_617, (*spvDescriptorSet0.vp_c3)._m0[26].y, _613);
                float _621 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _623 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _625 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _627 = fma(_619, _45, _605);
                float _629 = -_615;
                float _631 = _629 + 1.0;
                float _633 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _635 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _637 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _639 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _641 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _643 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].y, _621);
                float _645 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].x, _623);
                float _647 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].x, _625);
                float _649 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].y, _633);
                float _651 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].z, _635);
                float _653 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].z, _637);
                float _655 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].w, _639);
                float _657 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].w, _641);
                float _659 = -_627;
                float _661 = _659 + 1.0;
                float _663 = _627 * _643;
                float _665 = _627 * _645;
                float _667 = _627 * _651;
                float _669 = _627 * _657;
                float _671 = fma(_661, _649, _663);
                float _673 = fma(_661, _647, _665);
                float _675 = fma(_661, _653, _667);
                float _677 = fma(_661, _655, _669);
                _158 = _569;
                _162 = _577;
                _126 = _667;
                _128 = _657;
                _166 = _589;
                _170 = _597;
                _138 = _673;
                _144 = _671;
                _150 = _675;
                _154 = _677;
                _172 = true;
            }
            else
            {
                int _679 = _557 + 464;
                uint _681 = uint(int(uint(_679) >> uint(2)));
                uint _683 = uint(int(uint(int(_681)) >> uint(2)));
                int _685 = int(_681) & 3;
                float _687 = (*spvDescriptorSet0.vp_c3)._m0[int(_683)][_685];
                int _689 = int(_681) + 1;
                uint _691 = uint(int(uint(_689) >> uint(2)));
                int _693 = _689 & 3;
                float _695 = (*spvDescriptorSet0.vp_c3)._m0[int(_691)][_693];
                int _697 = _557 + 472;
                uint _699 = uint(int(uint(_697) >> uint(2)));
                uint _701 = uint(int(uint(int(_699)) >> uint(2)));
                int _703 = int(_699) & 3;
                float _705 = (*spvDescriptorSet0.vp_c3)._m0[int(_701)][_703];
                int _707 = int(_699) + 1;
                uint _709 = uint(int(uint(_707) >> uint(2)));
                int _711 = _707 & 3;
                float _713 = (*spvDescriptorSet0.vp_c3)._m0[int(_709)][_711];
                int _715 = _557 + 224;
                uint _717 = uint(int(uint(_715) >> uint(2)));
                uint _719 = uint(int(uint(int(_717)) >> uint(2)));
                int _721 = int(_717) & 3;
                float _723 = (*spvDescriptorSet0.vp_c3)._m0[int(_719)][_721];
                int _725 = int(_717) + 1;
                uint _727 = uint(int(uint(_725) >> uint(2)));
                int _729 = _725 & 3;
                float _731 = (*spvDescriptorSet0.vp_c3)._m0[int(_727)][_729];
                int _733 = _557 + 288;
                uint _735 = uint(int(uint(_733) >> uint(2)));
                uint _737 = uint(int(uint(int(_735)) >> uint(2)));
                int _739 = int(_735) & 3;
                float _741 = (*spvDescriptorSet0.vp_c3)._m0[int(_737)][_739];
                int _743 = int(_735) + 1;
                uint _745 = uint(int(uint(_743) >> uint(2)));
                int _747 = _743 & 3;
                float _749 = (*spvDescriptorSet0.vp_c3)._m0[int(_745)][_747];
                _158 = _723;
                _162 = _731;
                _166 = _741;
                _170 = _749;
                _138 = _687;
                _144 = _695;
                _150 = _705;
                _154 = _713;
            }
        }
    }
    _172 = false;
    float _751 = _158;
    float _753 = _162;
    bool _755 = _134;
    float _757 = _126;
    float _759 = _128;
    float _761 = _166;
    float _763 = _170;
    float _765 = _138;
    float _767 = _144;
    float _769 = _150;
    float _771 = _154;
    bool _773 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _775 = !_773;
    float _777 = _757;
    float _779 = _759;
    float _781 = _751;
    float _783 = _753;
    float _785 = _761;
    float _787 = _763;
    float _801;
    float _803;
    if (!_775)
    {
        float _789 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _791 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _793 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _789);
        float _795 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _791);
        float _797 = _793 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _799 = _795 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _801 = _799;
        _803 = _797;
        _805 = true;
    }
    else
    {
        int _807 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _809 = _807 != 0;
        if (!_809)
        {
            _777 = _751;
        }
        float _811 = _777;
        float _813 = _811;
        _803 = _811;
        if (!_809)
        {
            _779 = _753;
        }
        float _815 = _779;
        bool _817 = !_809;
        float _819 = _815;
        _801 = _815;
        if (!_817)
        {
            if (!_755)
            {
                _813 = _751;
            }
            float _821 = _813;
            float _823 = _821;
            int _825 = as_type<int>(_821);
            if (!_755)
            {
                _819 = _753;
            }
            float _827 = _819;
            bool _829 = !_755;
            float _831 = _827;
            float _833 = _827;
            if (!_829)
            {
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _837 = _835 != 0;
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _853 = _851 != 0;
                if (_837)
                {
                    _823 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _855 = _823;
                float _857 = _855;
                if (_837)
                {
                    _831 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _859 = _831;
                float _861 = _859;
                if (!_837)
                {
                    _857 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _857;
                if (!_837)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _865 = _861;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _869 = _865 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_849)
                {
                    float _871 = _867 * _751;
                    _781 = _871;
                }
                float _873 = _781;
                float _875 = -_867;
                float _877 = _875 + 1.0;
                int _879 = as_type<int>(_873);
                if (_853)
                {
                    float _881 = _869 * _753;
                    _783 = _881;
                }
                float _883 = _783;
                float _885 = -_869;
                float _887 = _885 + 1.0;
                float _889 = _883;
                if (_841)
                {
                    float _891 = _873 + _877;
                    _879 = as_type<int>(_891);
                }
                int _893 = _879;
                if (_845)
                {
                    float _895 = _883 + _887;
                    _889 = _895;
                }
                float _897 = _889;
                _825 = _893;
                _833 = _897;
            }
            int _899 = _825;
            float _901 = _833;
            int _903 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _905 = _903 != 0;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _913 = _911 != 0;
            int _915 = _899;
            int _917 = as_type<int>(_901);
            if (_909)
            {
                float _919 = -as_type<float>(_899);
                float _921 = _919 + 1.0;
                _915 = as_type<int>(_921);
            }
            int _923 = _915;
            if (_913)
            {
                float _925 = -_901;
                float _927 = _925 + 1.0;
                _917 = as_type<int>(_927);
            }
            int _929 = _917;
            bool _931 = !_905;
            float _933 = _931 ? as_type<float>(_923) : as_type<float>(_929);
            bool _935 = !_905;
            float _937 = _935 ? as_type<float>(_929) : as_type<float>(_923);
            _801 = _937;
            _803 = _933;
        }
    }
    _805 = false;
    float _939 = _801;
    float _941 = _803;
    float _943 = _939 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _945 = _939 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _947 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _949 = fma(_941, (*spvDescriptorSet0.vp_c3)._m0[8].x, _943);
    float _951 = fma(_941, (*spvDescriptorSet0.vp_c3)._m0[7].x, _945);
    float _953 = _949 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _955 = _951 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _957 = -_953;
    float _959 = _957 + 1.0;
    out.m_27.x = _955;
    out.m_27.y = _959;
    bool _961 = !_947;
    float _963 = _959;
    float _965 = _955;
    float _979;
    float _981;
    if (!_961)
    {
        float _967 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _969 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _971 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _967);
        float _973 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _969);
        float _975 = _971 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _977 = _973 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _979 = _977;
        _981 = _975;
        _983 = true;
    }
    else
    {
        int _985 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _987 = _985 != 0;
        if (!_987)
        {
            _963 = _761;
        }
        float _989 = _963;
        float _991 = _989;
        _981 = _989;
        if (!_987)
        {
            _965 = _763;
        }
        float _993 = _965;
        bool _995 = !_987;
        float _997 = _993;
        _979 = _993;
        if (!_995)
        {
            if (!_755)
            {
                _991 = _761;
            }
            float _999 = _991;
            float _1001 = _999;
            int _1003 = as_type<int>(_999);
            if (!_755)
            {
                _997 = _763;
            }
            float _1005 = _997;
            bool _1007 = !_755;
            float _1009 = _1005;
            float _1011 = _1005;
            if (!_1007)
            {
                int _1013 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1015 = _1013 != 0;
                int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1019 = _1017 != 0;
                int _1021 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1023 = _1021 != 0;
                int _1025 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1027 = _1025 != 0;
                int _1029 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1031 = _1029 != 0;
                if (_1015)
                {
                    _1001 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1033 = _1001;
                float _1035 = _1033;
                if (_1015)
                {
                    _1009 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1037 = _1009;
                float _1039 = _1037;
                if (!_1015)
                {
                    _1035 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1041 = _1035;
                if (!_1015)
                {
                    _1039 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1043 = _1039;
                float _1045 = _1041 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1047 = _1043 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1027)
                {
                    float _1049 = _1045 * _761;
                    _785 = _1049;
                }
                float _1051 = _785;
                float _1053 = -_1045;
                float _1055 = _1053 + 1.0;
                int _1057 = as_type<int>(_1051);
                if (_1031)
                {
                    float _1059 = _1047 * _763;
                    _787 = _1059;
                }
                float _1061 = _787;
                float _1063 = -_1047;
                float _1065 = _1063 + 1.0;
                float _1067 = _1061;
                if (_1019)
                {
                    float _1069 = _1051 + _1055;
                    _1057 = as_type<int>(_1069);
                }
                int _1071 = _1057;
                if (_1023)
                {
                    float _1073 = _1061 + _1065;
                    _1067 = _1073;
                }
                float _1075 = _1067;
                _1003 = _1071;
                _1011 = _1075;
            }
            int _1077 = _1003;
            float _1079 = _1011;
            int _1081 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1083 = _1081 != 0;
            int _1085 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1087 = _1085 != 0;
            int _1089 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1091 = _1089 != 0;
            int _1093 = _1077;
            int _1095 = as_type<int>(_1079);
            if (_1087)
            {
                float _1097 = -as_type<float>(_1077);
                float _1099 = _1097 + 1.0;
                _1093 = as_type<int>(_1099);
            }
            int _1101 = _1093;
            if (_1091)
            {
                float _1103 = -_1079;
                float _1105 = _1103 + 1.0;
                _1095 = as_type<int>(_1105);
            }
            int _1107 = _1095;
            bool _1109 = !_1083;
            float _1111 = _1109 ? as_type<float>(_1101) : as_type<float>(_1107);
            bool _1113 = !_1083;
            float _1115 = _1113 ? as_type<float>(_1107) : as_type<float>(_1101);
            _979 = _1115;
            _981 = _1111;
        }
    }
    _983 = false;
    float _1117 = _979;
    float _1119 = _981;
    float _1121 = _1117 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1125 = _765 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1127 = _767 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1121);
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1123);
    float _1133 = _769 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1135 = _771 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1141 = -_1137;
    float _1143 = _1141 + 1.0;
    out.m_29.x = _1125;
    out.m_29.y = _1127;
    out.m_29.z = _1133;
    out.m_29.w = _1135;
    out.m_31.x = _1139;
    out.m_31.y = _1143;
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _805 = false;
    bool _172 = false;
    bool _317 = false;
    bool _315 = false;
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
    float _114 = _97;
    float _116 = _99;
    float _118 = _67;
    float _120 = _91;
    float _122 = _101;
    float _124 = _103;
    float _126 = _47;
    float _128 = _45;
    bool _134;
    float _138;
    float _144;
    float _150;
    float _154;
    float _158;
    float _162;
    float _166;
    float _170;
    if (!_112)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _114 = 255.0;
        }
        float _136 = _114;
        _138 = _136;
        if (_132)
        {
            _116 = 255.0;
        }
        float _140 = _116;
        float _142 = 0.0;
        _144 = _140;
        if (_132)
        {
            _142 = 255.0;
        }
        float _146 = _142;
        float _148 = 0.0;
        _150 = _146;
        if (_132)
        {
            _148 = 255.0;
        }
        float _152 = _148;
        _154 = _152;
        if (_132)
        {
            _118 = _45;
        }
        float _156 = _118;
        _158 = _156;
        if (_132)
        {
            _120 = _47;
        }
        float _160 = _120;
        _162 = _160;
        if (_132)
        {
            _122 = _45;
        }
        float _164 = _122;
        _166 = _164;
        if (_132)
        {
            _124 = _47;
        }
        float _168 = _124;
        _170 = _168;
        _172 = _132;
        if (!_172)
        {
            float _174 = trunc(_45);
            int _176 = int(_174);
            float _178 = trunc(_47);
            int _180 = int(_178);
            int _182 = _180 << 1;
            int _184 = _182 + _176;
            int _186 = _184 << 4;
            int _188 = _186 + 224;
            uint _191 = uint(int(uint(_188) >> uint(2)));
            uint _193 = uint(int(uint(int(_191)) >> uint(2)));
            int _195 = int(_191) & 3;
            float _197 = (*spvDescriptorSet0.vp_c3)._m0[int(_193)][_195];
            int _199 = int(_191) + 1;
            uint _201 = uint(int(uint(_199) >> uint(2)));
            int _203 = _199 & 3;
            float _205 = (*spvDescriptorSet0.vp_c3)._m0[int(_201)][_203];
            int _207 = _186 + 288;
            uint _209 = uint(int(uint(_207) >> uint(2)));
            uint _211 = uint(int(uint(int(_209)) >> uint(2)));
            int _213 = int(_209) & 3;
            float _215 = (*spvDescriptorSet0.vp_c3)._m0[int(_211)][_213];
            int _217 = int(_209) + 1;
            uint _219 = uint(int(uint(_217) >> uint(2)));
            int _221 = _217 & 3;
            float _223 = (*spvDescriptorSet0.vp_c3)._m0[int(_219)][_221];
            _158 = _197;
            _162 = _205;
            _126 = as_type<float>(_180);
            _128 = as_type<float>(_176);
            _166 = _215;
            _170 = _223;
            _138 = 255.0;
            _144 = 255.0;
            _150 = 255.0;
            _154 = 255.0;
            _172 = true;
        }
    }
    else
    {
        int _225 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _227 = _225 != 0;
        uint _229 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _231 = int(_229) & 15;
        bool _233 = !_227;
        float _235 = as_type<float>(_231);
        _134 = _227;
        if (!_233)
        {
            uint _237 = min(uint(_231), 13u);
            float _239 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _241 = int(_237) << 2;
            uint _243 = uint(int(uint(_241) >> uint(2)));
            uint _245 = uint(int(uint(int(_243)) >> uint(2)));
            int _247 = int(_243) & 3;
            float _249 = (*spvDescriptorSet0.vp_c1)._m0[int(_245)][_247];
            float _251 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _253 = _239 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _255 = _239 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _257 = _251 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _259 = _251 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _261 = as_type<int>(_249) >> 31;
            bool _263 = as_type<int>(_249) == 1120;
            float _265 = as_type<float>(_261);
            float _267 = _255;
            float _269 = _249;
            float _271 = _259;
            if (!_263)
            {
                bool _273 = as_type<int>(_249) == 1168;
                _275 = _273;
                if (!_275)
                {
                    bool _277 = as_type<int>(_249) == 1232;
                    _279 = _277;
                    if (!_279)
                    {
                        bool _281 = as_type<int>(_249) == 1296;
                        _283 = _281;
                        if (!_283)
                        {
                            bool _285 = as_type<int>(_249) == 1376;
                            _287 = _285;
                            if (!_287)
                            {
                                bool _289 = as_type<int>(_249) == 1456;
                                _291 = _289;
                                if (!_291)
                                {
                                    bool _293 = as_type<int>(_249) == 1552;
                                    _295 = _293;
                                    if (!_295)
                                    {
                                        bool _297 = as_type<int>(_249) == 1632;
                                        _299 = _297;
                                        if (!_299)
                                        {
                                            bool _301 = as_type<int>(_249) == 1728;
                                            _303 = _301;
                                            if (!_303)
                                            {
                                                bool _305 = as_type<int>(_249) == 1792;
                                                _307 = _305;
                                                if (!_307)
                                                {
                                                    bool _309 = as_type<int>(_249) == 1872;
                                                    _311 = _309;
                                                    if (!_311)
                                                    {
                                                        bool _313 = as_type<int>(_249) == 1936;
                                                        _315 = _313;
                                                        if (!_315)
                                                        {
                                                            _317 = true;
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
            float _323;
            float _325;
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
                                                    if (!_315)
                                                    {
                                                        if (!_317)
                                                        {
                                                            float _319 = _253 * _45;
                                                            float _321 = _257 * _47;
                                                            _323 = _321;
                                                            _325 = _319;
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
            if ((((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279) || _275)
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
                                                    if ((!_315) || _275)
                                                    {
                                                        if ((!_317) || _275)
                                                        {
                                                            _275 = false;
                                                            float _327 = -_255;
                                                            float _329 = _327 + 1.0;
                                                            float _331 = _257 * _47;
                                                            float _333 = fma(_255, _45, _329);
                                                            _323 = _331;
                                                            _325 = _333;
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
                if (((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283) || _279)
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
                                                    if ((!_315) || _279)
                                                    {
                                                        if ((!_317) || _279)
                                                        {
                                                            _279 = false;
                                                            float _335 = -_259;
                                                            float _337 = _335 + 1.0;
                                                            float _339 = _253 * _45;
                                                            float _341 = fma(_259, _47, _337);
                                                            _323 = _341;
                                                            _325 = _339;
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
                    if ((((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287) || _283)
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
                                                    if ((!_315) || _283)
                                                    {
                                                        if ((!_317) || _283)
                                                        {
                                                            _283 = false;
                                                            float _343 = -_255;
                                                            float _345 = _343 + 1.0;
                                                            float _347 = -_259;
                                                            float _349 = _347 + 1.0;
                                                            float _351 = fma(_255, _45, _345);
                                                            float _353 = fma(_259, _47, _349);
                                                            _323 = _353;
                                                            _325 = _351;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291) || _287)
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
                                                    if ((!_315) || _287)
                                                    {
                                                        if ((!_317) || _287)
                                                        {
                                                            _287 = false;
                                                            float _355 = -_257;
                                                            float _357 = _355 + 1.0;
                                                            float _359 = _253 * _45;
                                                            float _361 = -_259;
                                                            float _363 = _361 + _357;
                                                            float _365 = fma(_363, _47, _257);
                                                            _323 = _365;
                                                            _325 = _359;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295) || _291)
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
                                                    if ((!_315) || _291)
                                                    {
                                                        if ((!_317) || _291)
                                                        {
                                                            _291 = false;
                                                            float _367 = -_257;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_255;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = -_259;
                                                            float _377 = _375 + _369;
                                                            float _379 = fma(_255, _45, _373);
                                                            float _381 = fma(_377, _47, _257);
                                                            _323 = _381;
                                                            _325 = _379;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _317) || _315) || _311) || _307) || _303) || _299) || _295)
                                {
                                    if ((!_299) || _295)
                                    {
                                        if ((!_303) || _295)
                                        {
                                            if ((!_307) || _295)
                                            {
                                                if ((!_311) || _295)
                                                {
                                                    if ((!_315) || _295)
                                                    {
                                                        if ((!_317) || _295)
                                                        {
                                                            _295 = false;
                                                            float _383 = -_253;
                                                            float _385 = _383 + 1.0;
                                                            float _387 = _257 * _47;
                                                            float _389 = -_255;
                                                            float _391 = _389 + _385;
                                                            float _393 = fma(_391, _45, _253);
                                                            _323 = _387;
                                                            _325 = _393;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _317) || _315) || _311) || _307) || _303) || _299)
                                    {
                                        if ((!_303) || _299)
                                        {
                                            if ((!_307) || _299)
                                            {
                                                if ((!_311) || _299)
                                                {
                                                    if ((!_315) || _299)
                                                    {
                                                        if ((!_317) || _299)
                                                        {
                                                            _299 = false;
                                                            float _395 = -_253;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = -_259;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = -_255;
                                                            float _405 = _403 + _397;
                                                            float _407 = fma(_259, _47, _401);
                                                            float _409 = fma(_405, _45, _253);
                                                            _323 = _407;
                                                            _325 = _409;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _317) || _315) || _311) || _307) || _303)
                                        {
                                            if ((!_307) || _303)
                                            {
                                                if ((!_311) || _303)
                                                {
                                                    if ((!_315) || _303)
                                                    {
                                                        if ((!_317) || _303)
                                                        {
                                                            _303 = false;
                                                            float _411 = -_255;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = _257 * _47;
                                                            float _417 = _413 * _45;
                                                            _323 = _415;
                                                            _325 = _417;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _317) || _315) || _311) || _307)
                                            {
                                                if ((!_311) || _307)
                                                {
                                                    if ((!_315) || _307)
                                                    {
                                                        if ((!_317) || _307)
                                                        {
                                                            _307 = false;
                                                            float _419 = -_255;
                                                            float _421 = _419 + 1.0;
                                                            float _423 = -_259;
                                                            float _425 = _423 + 1.0;
                                                            float _427 = fma(_255, _45, _421);
                                                            float _429 = _425 * _47;
                                                            _323 = _429;
                                                            _325 = _427;
                                                        }
                                                    }
                                                }
                                                if (((false || _317) || _315) || _311)
                                                {
                                                    if ((!_315) || _311)
                                                    {
                                                        if ((!_317) || _311)
                                                        {
                                                            _311 = false;
                                                            float _431 = -_257;
                                                            float _433 = _431 + 1.0;
                                                            float _435 = _253 * _45;
                                                            float _437 = fma(_433, _47, _257);
                                                            _323 = _437;
                                                            _325 = _435;
                                                        }
                                                    }
                                                    if ((false || _317) || _315)
                                                    {
                                                        if ((!_317) || _315)
                                                        {
                                                            _315 = false;
                                                            float _439 = -_253;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_259;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = fma(_441, _45, _253);
                                                            float _449 = fma(_259, _47, _445);
                                                            _323 = _449;
                                                            _325 = _447;
                                                        }
                                                        if (false || _317)
                                                        {
                                                            _317 = false;
                                                            bool _451 = _231 != 12;
                                                            if (!_451)
                                                            {
                                                                float _453 = -_257;
                                                                float _455 = _453 + 1.0;
                                                                _265 = _455;
                                                            }
                                                            float _457 = _265;
                                                            if (!_451)
                                                            {
                                                                float _459 = -_255;
                                                                float _461 = _459 + 1.0;
                                                                _267 = _461;
                                                            }
                                                            float _463 = _267;
                                                            if (_451)
                                                            {
                                                                _269 = 0.0;
                                                            }
                                                            float _465 = _269;
                                                            float _467 = _465;
                                                            if (!_451)
                                                            {
                                                                float _469 = -_259;
                                                                float _471 = _469 + _457;
                                                                _271 = _471;
                                                            }
                                                            float _473 = _271;
                                                            if (_451)
                                                            {
                                                                _235 = 0.0;
                                                            }
                                                            float _475 = _235;
                                                            _323 = _475;
                                                            if (!_451)
                                                            {
                                                                float _477 = _45 * _463;
                                                                _467 = _477;
                                                            }
                                                            float _479 = _467;
                                                            _325 = _479;
                                                            if (!_451)
                                                            {
                                                                float _481 = _47 * _473;
                                                                _323 = _481;
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
            float _483 = _323;
            float _485 = _325;
            float _487 = -_483;
            float _489 = _487 + 1.0;
            float _491 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _493 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _495 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _497 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _499 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _501 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _503 = _483 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _505 = _483 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _507 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].x, _491);
            float _509 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].x, _493);
            float _511 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].y, _495);
            float _513 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].y, _497);
            float _515 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].z, _499);
            float _517 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].z, _501);
            float _519 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[29].w, _503);
            float _521 = fma(_489, (*spvDescriptorSet0.vp_c3)._m0[30].w, _505);
            float _523 = -_485;
            float _525 = _523 + 1.0;
            float _527 = _507 * _485;
            float _529 = _511 * _485;
            float _531 = _515 * _485;
            float _533 = _521 * _485;
            float _535 = fma(_525, _509, _527);
            float _537 = fma(_525, _513, _529);
            float _539 = fma(_525, _517, _531);
            float _541 = fma(_525, _519, _533);
            _158 = _45;
            _162 = _47;
            _166 = _45;
            _170 = _47;
            _138 = _535;
            _144 = _537;
            _150 = _539;
            _154 = _541;
            _172 = true;
        }
        else
        {
            float _543 = trunc(_45);
            int _545 = int(_543);
            bool _547 = _231 != 13;
            float _549 = trunc(_47);
            int _551 = int(_549);
            int _553 = _551 << 1;
            int _555 = _553 + _545;
            int _557 = _555 << 4;
            if (!_547)
            {
                float _559 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                int _561 = _557 + 224;
                uint _563 = uint(int(uint(_561) >> uint(2)));
                uint _565 = uint(int(uint(int(_563)) >> uint(2)));
                int _567 = int(_563) & 3;
                float _569 = (*spvDescriptorSet0.vp_c3)._m0[int(_565)][_567];
                int _571 = int(_563) + 1;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                int _575 = _571 & 3;
                float _577 = (*spvDescriptorSet0.vp_c3)._m0[int(_573)][_575];
                float _579 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                int _581 = _557 + 288;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                uint _585 = uint(int(uint(int(_583)) >> uint(2)));
                int _587 = int(_583) & 3;
                float _589 = (*spvDescriptorSet0.vp_c3)._m0[int(_585)][_587];
                int _591 = int(_583) + 1;
                uint _593 = uint(int(uint(_591) >> uint(2)));
                int _595 = _591 & 3;
                float _597 = (*spvDescriptorSet0.vp_c3)._m0[int(_593)][_595];
                float _599 = _559 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _601 = -_599;
                float _603 = _601 + 1.0;
                float _605 = _579 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _607 = -_559;
                float _609 = fma(_607, (*spvDescriptorSet0.vp_c3)._m0[26].w, _603);
                float _611 = -_605;
                float _613 = _611 + 1.0;
                float _615 = fma(_609, _47, _599);
                float _617 = -_579;
                float _619 = fma(_617, (*spvDescriptorSet0.vp_c3)._m0[26].y, _613);
                float _621 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _623 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _625 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _627 = fma(_619, _45, _605);
                float _629 = -_615;
                float _631 = _629 + 1.0;
                float _633 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _635 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _637 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _639 = _615 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _641 = _615 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _643 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].y, _621);
                float _645 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].x, _623);
                float _647 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].x, _625);
                float _649 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].y, _633);
                float _651 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].z, _635);
                float _653 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].z, _637);
                float _655 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[29].w, _639);
                float _657 = fma(_631, (*spvDescriptorSet0.vp_c3)._m0[30].w, _641);
                float _659 = -_627;
                float _661 = _659 + 1.0;
                float _663 = _627 * _643;
                float _665 = _627 * _645;
                float _667 = _627 * _651;
                float _669 = _627 * _657;
                float _671 = fma(_661, _649, _663);
                float _673 = fma(_661, _647, _665);
                float _675 = fma(_661, _653, _667);
                float _677 = fma(_661, _655, _669);
                _158 = _569;
                _162 = _577;
                _126 = _667;
                _128 = _657;
                _166 = _589;
                _170 = _597;
                _138 = _673;
                _144 = _671;
                _150 = _675;
                _154 = _677;
                _172 = true;
            }
            else
            {
                int _679 = _557 + 464;
                uint _681 = uint(int(uint(_679) >> uint(2)));
                uint _683 = uint(int(uint(int(_681)) >> uint(2)));
                int _685 = int(_681) & 3;
                float _687 = (*spvDescriptorSet0.vp_c3)._m0[int(_683)][_685];
                int _689 = int(_681) + 1;
                uint _691 = uint(int(uint(_689) >> uint(2)));
                int _693 = _689 & 3;
                float _695 = (*spvDescriptorSet0.vp_c3)._m0[int(_691)][_693];
                int _697 = _557 + 472;
                uint _699 = uint(int(uint(_697) >> uint(2)));
                uint _701 = uint(int(uint(int(_699)) >> uint(2)));
                int _703 = int(_699) & 3;
                float _705 = (*spvDescriptorSet0.vp_c3)._m0[int(_701)][_703];
                int _707 = int(_699) + 1;
                uint _709 = uint(int(uint(_707) >> uint(2)));
                int _711 = _707 & 3;
                float _713 = (*spvDescriptorSet0.vp_c3)._m0[int(_709)][_711];
                int _715 = _557 + 224;
                uint _717 = uint(int(uint(_715) >> uint(2)));
                uint _719 = uint(int(uint(int(_717)) >> uint(2)));
                int _721 = int(_717) & 3;
                float _723 = (*spvDescriptorSet0.vp_c3)._m0[int(_719)][_721];
                int _725 = int(_717) + 1;
                uint _727 = uint(int(uint(_725) >> uint(2)));
                int _729 = _725 & 3;
                float _731 = (*spvDescriptorSet0.vp_c3)._m0[int(_727)][_729];
                int _733 = _557 + 288;
                uint _735 = uint(int(uint(_733) >> uint(2)));
                uint _737 = uint(int(uint(int(_735)) >> uint(2)));
                int _739 = int(_735) & 3;
                float _741 = (*spvDescriptorSet0.vp_c3)._m0[int(_737)][_739];
                int _743 = int(_735) + 1;
                uint _745 = uint(int(uint(_743) >> uint(2)));
                int _747 = _743 & 3;
                float _749 = (*spvDescriptorSet0.vp_c3)._m0[int(_745)][_747];
                _158 = _723;
                _162 = _731;
                _166 = _741;
                _170 = _749;
                _138 = _687;
                _144 = _695;
                _150 = _705;
                _154 = _713;
            }
        }
    }
    _172 = false;
    float _751 = _158;
    float _753 = _162;
    bool _755 = _134;
    float _757 = _126;
    float _759 = _128;
    float _761 = _166;
    float _763 = _170;
    float _765 = _138;
    float _767 = _144;
    float _769 = _150;
    float _771 = _154;
    bool _773 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _775 = !_773;
    float _777 = _757;
    float _779 = _759;
    float _781 = _751;
    float _783 = _753;
    float _785 = _761;
    float _787 = _763;
    float _801;
    float _803;
    if (!_775)
    {
        float _789 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _791 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _793 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _789);
        float _795 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _791);
        float _797 = _793 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _799 = _795 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _801 = _799;
        _803 = _797;
        _805 = true;
    }
    else
    {
        int _807 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _809 = _807 != 0;
        if (!_809)
        {
            _777 = _751;
        }
        float _811 = _777;
        float _813 = _811;
        _803 = _811;
        if (!_809)
        {
            _779 = _753;
        }
        float _815 = _779;
        bool _817 = !_809;
        float _819 = _815;
        _801 = _815;
        if (!_817)
        {
            if (!_755)
            {
                _813 = _751;
            }
            float _821 = _813;
            float _823 = _821;
            int _825 = as_type<int>(_821);
            if (!_755)
            {
                _819 = _753;
            }
            float _827 = _819;
            bool _829 = !_755;
            float _831 = _827;
            float _833 = _827;
            if (!_829)
            {
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _837 = _835 != 0;
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _853 = _851 != 0;
                if (_837)
                {
                    _823 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _855 = _823;
                float _857 = _855;
                if (_837)
                {
                    _831 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _859 = _831;
                float _861 = _859;
                if (!_837)
                {
                    _857 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _857;
                if (!_837)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _865 = _861;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _869 = _865 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_849)
                {
                    float _871 = _867 * _751;
                    _781 = _871;
                }
                float _873 = _781;
                float _875 = -_867;
                float _877 = _875 + 1.0;
                int _879 = as_type<int>(_873);
                if (_853)
                {
                    float _881 = _869 * _753;
                    _783 = _881;
                }
                float _883 = _783;
                float _885 = -_869;
                float _887 = _885 + 1.0;
                float _889 = _883;
                if (_841)
                {
                    float _891 = _873 + _877;
                    _879 = as_type<int>(_891);
                }
                int _893 = _879;
                if (_845)
                {
                    float _895 = _883 + _887;
                    _889 = _895;
                }
                float _897 = _889;
                _825 = _893;
                _833 = _897;
            }
            int _899 = _825;
            float _901 = _833;
            int _903 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _905 = _903 != 0;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _913 = _911 != 0;
            int _915 = _899;
            int _917 = as_type<int>(_901);
            if (_909)
            {
                float _919 = -as_type<float>(_899);
                float _921 = _919 + 1.0;
                _915 = as_type<int>(_921);
            }
            int _923 = _915;
            if (_913)
            {
                float _925 = -_901;
                float _927 = _925 + 1.0;
                _917 = as_type<int>(_927);
            }
            int _929 = _917;
            bool _931 = !_905;
            float _933 = _931 ? as_type<float>(_923) : as_type<float>(_929);
            bool _935 = !_905;
            float _937 = _935 ? as_type<float>(_929) : as_type<float>(_923);
            _801 = _937;
            _803 = _933;
        }
    }
    _805 = false;
    float _939 = _801;
    float _941 = _803;
    float _943 = _939 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _945 = _939 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _947 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _949 = fma(_941, (*spvDescriptorSet0.vp_c3)._m0[8].x, _943);
    float _951 = fma(_941, (*spvDescriptorSet0.vp_c3)._m0[7].x, _945);
    float _953 = _949 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _955 = _951 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _957 = -_953;
    float _959 = _957 + 1.0;
    out.m_27.x = _955;
    out.m_27.y = _959;
    bool _961 = !_947;
    float _963 = _959;
    float _965 = _955;
    float _979;
    float _981;
    if (!_961)
    {
        float _967 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _969 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _971 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _967);
        float _973 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _969);
        float _975 = _971 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _977 = _973 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _979 = _977;
        _981 = _975;
        _983 = true;
    }
    else
    {
        int _985 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _987 = _985 != 0;
        if (!_987)
        {
            _963 = _761;
        }
        float _989 = _963;
        float _991 = _989;
        _981 = _989;
        if (!_987)
        {
            _965 = _763;
        }
        float _993 = _965;
        bool _995 = !_987;
        float _997 = _993;
        _979 = _993;
        if (!_995)
        {
            if (!_755)
            {
                _991 = _761;
            }
            float _999 = _991;
            float _1001 = _999;
            int _1003 = as_type<int>(_999);
            if (!_755)
            {
                _997 = _763;
            }
            float _1005 = _997;
            bool _1007 = !_755;
            float _1009 = _1005;
            float _1011 = _1005;
            if (!_1007)
            {
                int _1013 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1015 = _1013 != 0;
                int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1019 = _1017 != 0;
                int _1021 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1023 = _1021 != 0;
                int _1025 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1027 = _1025 != 0;
                int _1029 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1031 = _1029 != 0;
                if (_1015)
                {
                    _1001 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1033 = _1001;
                float _1035 = _1033;
                if (_1015)
                {
                    _1009 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1037 = _1009;
                float _1039 = _1037;
                if (!_1015)
                {
                    _1035 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1041 = _1035;
                if (!_1015)
                {
                    _1039 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1043 = _1039;
                float _1045 = _1041 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1047 = _1043 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1027)
                {
                    float _1049 = _1045 * _761;
                    _785 = _1049;
                }
                float _1051 = _785;
                float _1053 = -_1045;
                float _1055 = _1053 + 1.0;
                int _1057 = as_type<int>(_1051);
                if (_1031)
                {
                    float _1059 = _1047 * _763;
                    _787 = _1059;
                }
                float _1061 = _787;
                float _1063 = -_1047;
                float _1065 = _1063 + 1.0;
                float _1067 = _1061;
                if (_1019)
                {
                    float _1069 = _1051 + _1055;
                    _1057 = as_type<int>(_1069);
                }
                int _1071 = _1057;
                if (_1023)
                {
                    float _1073 = _1061 + _1065;
                    _1067 = _1073;
                }
                float _1075 = _1067;
                _1003 = _1071;
                _1011 = _1075;
            }
            int _1077 = _1003;
            float _1079 = _1011;
            int _1081 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1083 = _1081 != 0;
            int _1085 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1087 = _1085 != 0;
            int _1089 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1091 = _1089 != 0;
            int _1093 = _1077;
            int _1095 = as_type<int>(_1079);
            if (_1087)
            {
                float _1097 = -as_type<float>(_1077);
                float _1099 = _1097 + 1.0;
                _1093 = as_type<int>(_1099);
            }
            int _1101 = _1093;
            if (_1091)
            {
                float _1103 = -_1079;
                float _1105 = _1103 + 1.0;
                _1095 = as_type<int>(_1105);
            }
            int _1107 = _1095;
            bool _1109 = !_1083;
            float _1111 = _1109 ? as_type<float>(_1101) : as_type<float>(_1107);
            bool _1113 = !_1083;
            float _1115 = _1113 ? as_type<float>(_1107) : as_type<float>(_1101);
            _979 = _1115;
            _981 = _1111;
        }
    }
    _983 = false;
    float _1117 = _979;
    float _1119 = _981;
    float _1121 = _1117 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1125 = _765 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1127 = _767 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1121);
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1123);
    float _1133 = _769 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1135 = _771 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1141 = -_1137;
    float _1143 = _1141 + 1.0;
    out.m_29.x = _1125;
    out.m_29.y = _1127;
    out.m_29.z = _1133;
    out.m_29.w = _1135;
    out.m_31.x = _1139;
    out.m_31.y = _1143;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


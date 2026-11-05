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
    float4 m_27 [[user(locn1)]];
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
    bool _789 = false;
    bool _158 = false;
    bool _323 = false;
    bool _321 = false;
    bool _317 = false;
    bool _313 = false;
    bool _309 = false;
    bool _305 = false;
    bool _301 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    bool _110 = !_108;
    float _112 = _87;
    float _114 = _65;
    float _116 = _89;
    float _118 = _95;
    float _120 = _97;
    float _122 = _99;
    float _124 = _101;
    float _126 = _45;
    float _128 = _43;
    float _130 = _49;
    bool _136;
    float _140;
    float _144;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _112 = 1.0;
        }
        float _138 = _112;
        _140 = _138;
        if (_134)
        {
            _114 = 255.0;
        }
        float _142 = _114;
        _144 = _142;
        if (_134)
        {
            _116 = 255.0;
        }
        float _146 = _116;
        _148 = _146;
        if (_134)
        {
            _118 = 255.0;
        }
        float _150 = _118;
        _152 = _150;
        if (_134)
        {
            _120 = 255.0;
        }
        float _154 = _120;
        _156 = _154;
        _158 = _134;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            bool _174 = _172 == 0;
            bool _176 = _172 == 16;
            bool _178 = _172 == 32;
            bool _180 = _172 == 48;
            float _182 = as_type<float>(_162);
            float _184 = as_type<float>(_166);
            float _186 = as_type<float>(_172);
            _144 = 255.0;
            _148 = 255.0;
            _152 = 255.0;
            _156 = 255.0;
            if (_174)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _188 = _182;
            float _190 = _188;
            if (_174)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _192 = _184;
            float _194 = _192;
            if (_174)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _196 = _186;
            float _198 = _196;
            if (_176)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _200 = _190;
            float _202 = _200;
            if (_176)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _204 = _194;
            float _206 = _204;
            if (_176)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _208 = _198;
            float _210 = _208;
            if (_178)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _212 = _202;
            float _214 = _212;
            if (_178)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _216 = _206;
            float _218 = _216;
            if (_178)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _220 = _210;
            float _222 = _220;
            if (_180)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _224 = _214;
            _128 = _224;
            if (_180)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _226 = _218;
            _126 = _226;
            if (_180)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _228 = _222;
            _140 = _228;
            _158 = true;
        }
    }
    else
    {
        int _230 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _232 = _230 != 0;
        uint _235 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _237 = int(_235) & 15;
        bool _239 = !_232;
        float _241 = as_type<float>(_237);
        _136 = _232;
        if (!_239)
        {
            uint _243 = min(uint(_237), 13u);
            float _245 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _247 = int(_243) << 2;
            uint _249 = uint(int(uint(_247) >> uint(2)));
            uint _251 = uint(int(uint(int(_249)) >> uint(2)));
            int _253 = int(_249) & 3;
            float _255 = (*spvDescriptorSet0.vp_c1)._m0[int(_251)][_253];
            float _257 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _259 = _245 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _261 = _245 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _263 = _257 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _265 = _257 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _267 = as_type<int>(_255) >> 31;
            bool _269 = as_type<int>(_255) == 1296;
            float _271 = as_type<float>(_267);
            float _273 = _261;
            float _275 = _255;
            float _277 = _265;
            if (!_269)
            {
                bool _279 = as_type<int>(_255) == 1344;
                _281 = _279;
                if (!_281)
                {
                    bool _283 = as_type<int>(_255) == 1408;
                    _285 = _283;
                    if (!_285)
                    {
                        bool _287 = as_type<int>(_255) == 1472;
                        _289 = _287;
                        if (!_289)
                        {
                            bool _291 = as_type<int>(_255) == 1552;
                            _293 = _291;
                            if (!_293)
                            {
                                bool _295 = as_type<int>(_255) == 1632;
                                _297 = _295;
                                if (!_297)
                                {
                                    bool _299 = as_type<int>(_255) == 1728;
                                    _301 = _299;
                                    if (!_301)
                                    {
                                        bool _303 = as_type<int>(_255) == 1808;
                                        _305 = _303;
                                        if (!_305)
                                        {
                                            bool _307 = as_type<int>(_255) == 1904;
                                            _309 = _307;
                                            if (!_309)
                                            {
                                                bool _311 = as_type<int>(_255) == 1968;
                                                _313 = _311;
                                                if (!_313)
                                                {
                                                    bool _315 = as_type<int>(_255) == 2048;
                                                    _317 = _315;
                                                    if (!_317)
                                                    {
                                                        bool _319 = as_type<int>(_255) == 2112;
                                                        _321 = _319;
                                                        if (!_321)
                                                        {
                                                            _323 = true;
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
            float _329;
            float _331;
            if (!_281)
            {
                if (!_285)
                {
                    if (!_289)
                    {
                        if (!_293)
                        {
                            if (!_297)
                            {
                                if (!_301)
                                {
                                    if (!_305)
                                    {
                                        if (!_309)
                                        {
                                            if (!_313)
                                            {
                                                if (!_317)
                                                {
                                                    if (!_321)
                                                    {
                                                        if (!_323)
                                                        {
                                                            float _325 = _259 * _43;
                                                            float _327 = _263 * _45;
                                                            _329 = _327;
                                                            _331 = _325;
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
            if ((((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285) || _281)
            {
                if ((!_285) || _281)
                {
                    if ((!_289) || _281)
                    {
                        if ((!_293) || _281)
                        {
                            if ((!_297) || _281)
                            {
                                if ((!_301) || _281)
                                {
                                    if ((!_305) || _281)
                                    {
                                        if ((!_309) || _281)
                                        {
                                            if ((!_313) || _281)
                                            {
                                                if ((!_317) || _281)
                                                {
                                                    if ((!_321) || _281)
                                                    {
                                                        if ((!_323) || _281)
                                                        {
                                                            _281 = false;
                                                            float _333 = -_261;
                                                            float _335 = _333 + 1.0;
                                                            float _337 = _263 * _45;
                                                            float _339 = fma(_261, _43, _335);
                                                            _329 = _337;
                                                            _331 = _339;
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
                if (((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285)
                {
                    if ((!_289) || _285)
                    {
                        if ((!_293) || _285)
                        {
                            if ((!_297) || _285)
                            {
                                if ((!_301) || _285)
                                {
                                    if ((!_305) || _285)
                                    {
                                        if ((!_309) || _285)
                                        {
                                            if ((!_313) || _285)
                                            {
                                                if ((!_317) || _285)
                                                {
                                                    if ((!_321) || _285)
                                                    {
                                                        if ((!_323) || _285)
                                                        {
                                                            _285 = false;
                                                            float _341 = -_265;
                                                            float _343 = _341 + 1.0;
                                                            float _345 = _259 * _43;
                                                            float _347 = fma(_265, _45, _343);
                                                            _329 = _347;
                                                            _331 = _345;
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
                    if ((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289)
                    {
                        if ((!_293) || _289)
                        {
                            if ((!_297) || _289)
                            {
                                if ((!_301) || _289)
                                {
                                    if ((!_305) || _289)
                                    {
                                        if ((!_309) || _289)
                                        {
                                            if ((!_313) || _289)
                                            {
                                                if ((!_317) || _289)
                                                {
                                                    if ((!_321) || _289)
                                                    {
                                                        if ((!_323) || _289)
                                                        {
                                                            _289 = false;
                                                            float _349 = -_261;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_265;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = fma(_261, _43, _351);
                                                            float _359 = fma(_265, _45, _355);
                                                            _329 = _359;
                                                            _331 = _357;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293)
                        {
                            if ((!_297) || _293)
                            {
                                if ((!_301) || _293)
                                {
                                    if ((!_305) || _293)
                                    {
                                        if ((!_309) || _293)
                                        {
                                            if ((!_313) || _293)
                                            {
                                                if ((!_317) || _293)
                                                {
                                                    if ((!_321) || _293)
                                                    {
                                                        if ((!_323) || _293)
                                                        {
                                                            _293 = false;
                                                            float _361 = -_263;
                                                            float _363 = _361 + 1.0;
                                                            float _365 = _259 * _43;
                                                            float _367 = -_265;
                                                            float _369 = _367 + _363;
                                                            float _371 = fma(_369, _45, _263);
                                                            _329 = _371;
                                                            _331 = _365;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297)
                            {
                                if ((!_301) || _297)
                                {
                                    if ((!_305) || _297)
                                    {
                                        if ((!_309) || _297)
                                        {
                                            if ((!_313) || _297)
                                            {
                                                if ((!_317) || _297)
                                                {
                                                    if ((!_321) || _297)
                                                    {
                                                        if ((!_323) || _297)
                                                        {
                                                            _297 = false;
                                                            float _373 = -_263;
                                                            float _375 = _373 + 1.0;
                                                            float _377 = -_261;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_265;
                                                            float _383 = _381 + _375;
                                                            float _385 = fma(_261, _43, _379);
                                                            float _387 = fma(_383, _45, _263);
                                                            _329 = _387;
                                                            _331 = _385;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301)
                                {
                                    if ((!_305) || _301)
                                    {
                                        if ((!_309) || _301)
                                        {
                                            if ((!_313) || _301)
                                            {
                                                if ((!_317) || _301)
                                                {
                                                    if ((!_321) || _301)
                                                    {
                                                        if ((!_323) || _301)
                                                        {
                                                            _301 = false;
                                                            float _389 = -_259;
                                                            float _391 = _389 + 1.0;
                                                            float _393 = _263 * _45;
                                                            float _395 = -_261;
                                                            float _397 = _395 + _391;
                                                            float _399 = fma(_397, _43, _259);
                                                            _329 = _393;
                                                            _331 = _399;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _323) || _321) || _317) || _313) || _309) || _305)
                                    {
                                        if ((!_309) || _305)
                                        {
                                            if ((!_313) || _305)
                                            {
                                                if ((!_317) || _305)
                                                {
                                                    if ((!_321) || _305)
                                                    {
                                                        if ((!_323) || _305)
                                                        {
                                                            _305 = false;
                                                            float _401 = -_259;
                                                            float _403 = _401 + 1.0;
                                                            float _405 = -_265;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = -_261;
                                                            float _411 = _409 + _403;
                                                            float _413 = fma(_265, _45, _407);
                                                            float _415 = fma(_411, _43, _259);
                                                            _329 = _413;
                                                            _331 = _415;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _323) || _321) || _317) || _313) || _309)
                                        {
                                            if ((!_313) || _309)
                                            {
                                                if ((!_317) || _309)
                                                {
                                                    if ((!_321) || _309)
                                                    {
                                                        if ((!_323) || _309)
                                                        {
                                                            _309 = false;
                                                            float _417 = -_261;
                                                            float _419 = _417 + 1.0;
                                                            float _421 = _263 * _45;
                                                            float _423 = _419 * _43;
                                                            _329 = _421;
                                                            _331 = _423;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _323) || _321) || _317) || _313)
                                            {
                                                if ((!_317) || _313)
                                                {
                                                    if ((!_321) || _313)
                                                    {
                                                        if ((!_323) || _313)
                                                        {
                                                            _313 = false;
                                                            float _425 = -_261;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = -_265;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = fma(_261, _43, _427);
                                                            float _435 = _431 * _45;
                                                            _329 = _435;
                                                            _331 = _433;
                                                        }
                                                    }
                                                }
                                                if (((false || _323) || _321) || _317)
                                                {
                                                    if ((!_321) || _317)
                                                    {
                                                        if ((!_323) || _317)
                                                        {
                                                            _317 = false;
                                                            float _437 = -_263;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = _259 * _43;
                                                            float _443 = fma(_439, _45, _263);
                                                            _329 = _443;
                                                            _331 = _441;
                                                        }
                                                    }
                                                    if ((false || _323) || _321)
                                                    {
                                                        if ((!_323) || _321)
                                                        {
                                                            _321 = false;
                                                            float _445 = -_259;
                                                            float _447 = _445 + 1.0;
                                                            float _449 = -_265;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = fma(_447, _43, _259);
                                                            float _455 = fma(_265, _45, _451);
                                                            _329 = _455;
                                                            _331 = _453;
                                                        }
                                                        if (false || _323)
                                                        {
                                                            _323 = false;
                                                            bool _457 = _237 != 12;
                                                            if (!_457)
                                                            {
                                                                float _459 = -_263;
                                                                float _461 = _459 + 1.0;
                                                                _271 = _461;
                                                            }
                                                            float _463 = _271;
                                                            if (!_457)
                                                            {
                                                                float _465 = -_261;
                                                                float _467 = _465 + 1.0;
                                                                _273 = _467;
                                                            }
                                                            float _469 = _273;
                                                            if (_457)
                                                            {
                                                                _275 = 0.0;
                                                            }
                                                            float _471 = _275;
                                                            float _473 = _471;
                                                            if (!_457)
                                                            {
                                                                float _475 = -_265;
                                                                float _477 = _475 + _463;
                                                                _277 = _477;
                                                            }
                                                            float _479 = _277;
                                                            if (_457)
                                                            {
                                                                _241 = 0.0;
                                                            }
                                                            float _481 = _241;
                                                            _329 = _481;
                                                            if (!_457)
                                                            {
                                                                float _483 = _43 * _469;
                                                                _473 = _483;
                                                            }
                                                            float _485 = _473;
                                                            _331 = _485;
                                                            if (!_457)
                                                            {
                                                                float _487 = _45 * _479;
                                                                _329 = _487;
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
            float _489 = _329;
            float _491 = _331;
            float _493 = -_489;
            float _495 = _493 + 1.0;
            float _497 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _499 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _501 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _503 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _505 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _507 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _509 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _511 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _513 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].x, _497);
            float _515 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].x, _499);
            float _517 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].y, _501);
            float _519 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].y, _503);
            float _521 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].z, _505);
            float _523 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].z, _507);
            float _525 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].w, _509);
            float _527 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].w, _511);
            float _529 = -_491;
            float _531 = _529 + 1.0;
            float _533 = _513 * _491;
            float _535 = _517 * _491;
            float _537 = _521 * _491;
            float _539 = _527 * _491;
            float _541 = fma(_531, _515, _533);
            float _543 = fma(_531, _519, _535);
            float _545 = fma(_531, _523, _537);
            float _547 = fma(_531, _525, _539);
            _140 = 1.0;
            _144 = _541;
            _148 = _543;
            _152 = _545;
            _156 = _547;
            _158 = true;
        }
        else
        {
            float _549 = trunc(_43);
            int _551 = int(_549);
            float _553 = trunc(_45);
            int _555 = int(_553);
            int _557 = _555 << 1;
            int _559 = _557 + _551;
            int _561 = _559 << 4;
            bool _563 = _561 == 0;
            bool _565 = _561 == 16;
            bool _567 = _561 == 32;
            bool _569 = _561 == 48;
            if (_563)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _571 = _122;
            float _573 = _571;
            if (_563)
            {
                _124 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _575 = _124;
            float _577 = 0.0;
            float _579 = _575;
            if (_563)
            {
                _577 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _581 = _577;
            bool _583 = _237 != 13;
            float _585 = _581;
            if (_565)
            {
                _573 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _587 = _573;
            float _589 = _587;
            if (_565)
            {
                _579 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _591 = _579;
            float _593 = _591;
            if (_565)
            {
                _585 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _595 = _585;
            float _597 = _595;
            if (_567)
            {
                _589 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _599 = _589;
            float _601 = _599;
            if (_567)
            {
                _593 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _603 = _593;
            float _605 = _603;
            if (_567)
            {
                _597 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _607 = _597;
            float _609 = _607;
            if (_569)
            {
                _601 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _611 = _601;
            if (_569)
            {
                _605 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _613 = _605;
            if (_569)
            {
                _609 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _615 = _609;
            if (!_583)
            {
                float _617 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _619 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _621 = _617 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _623 = -_621;
                float _625 = _623 + 1.0;
                float _627 = _619 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _629 = -_617;
                float _631 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[26].w, _625);
                float _633 = -_627;
                float _635 = _633 + 1.0;
                float _637 = fma(_631, _45, _621);
                float _639 = -_619;
                float _641 = fma(_639, (*spvDescriptorSet0.vp_c3)._m0[26].y, _635);
                float _643 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _645 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _647 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _649 = fma(_641, _43, _627);
                float _651 = -_637;
                float _653 = _651 + 1.0;
                float _655 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _657 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _659 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _661 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _663 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _665 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].y, _643);
                float _667 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].x, _645);
                float _669 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].x, _647);
                float _671 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].y, _655);
                float _673 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].z, _657);
                float _675 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].z, _659);
                float _677 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].w, _661);
                float _679 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].w, _663);
                float _681 = -_649;
                float _683 = _681 + 1.0;
                float _685 = _649 * _665;
                float _687 = _649 * _667;
                float _689 = _649 * _673;
                float _691 = _649 * _679;
                float _693 = fma(_683, _671, _685);
                float _695 = fma(_683, _669, _687);
                float _697 = fma(_683, _675, _689);
                float _699 = fma(_683, _677, _691);
                _126 = _613;
                _128 = _611;
                _140 = _615;
                _144 = _695;
                _148 = _693;
                _152 = _697;
                _156 = _699;
                _158 = true;
            }
            else
            {
                int _701 = _559 << 4;
                int _703 = _701 + 464;
                uint _705 = uint(int(uint(_703) >> uint(2)));
                uint _707 = uint(int(uint(int(_705)) >> uint(2)));
                int _709 = int(_705) & 3;
                float _711 = (*spvDescriptorSet0.vp_c3)._m0[int(_707)][_709];
                int _713 = int(_705) + 1;
                uint _715 = uint(int(uint(_713) >> uint(2)));
                int _717 = _713 & 3;
                float _719 = (*spvDescriptorSet0.vp_c3)._m0[int(_715)][_717];
                int _721 = _703 + 8;
                uint _723 = uint(int(uint(_721) >> uint(2)));
                uint _725 = uint(int(uint(int(_723)) >> uint(2)));
                int _727 = int(_723) & 3;
                float _729 = (*spvDescriptorSet0.vp_c3)._m0[int(_725)][_727];
                int _731 = int(_723) + 1;
                uint _733 = uint(int(uint(_731) >> uint(2)));
                int _735 = _731 & 3;
                float _737 = (*spvDescriptorSet0.vp_c3)._m0[int(_733)][_735];
                _126 = _613;
                _128 = _611;
                _140 = _615;
                _144 = _711;
                _148 = _719;
                _152 = _729;
                _156 = _737;
            }
        }
    }
    _158 = false;
    float _739 = _126;
    float _741 = _128;
    float _743 = _140;
    bool _745 = _136;
    float _747 = _144;
    float _749 = _148;
    float _751 = _152;
    float _753 = _156;
    bool _755 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _757 = !_755;
    float _759 = _741;
    float _761 = _741;
    float _763 = _739;
    float _783;
    float _785;
    int _787;
    if (!_757)
    {
        float _765 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _767 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _769 = _49 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _771 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _765);
        float _773 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _767);
        float _775 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[17].x, _769);
        float _777 = _771 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _779 = _773 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _781 = _775 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _783 = _779;
        _785 = _777;
        _787 = as_type<int>(_781);
        _789 = true;
    }
    else
    {
        int _791 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _793 = _791 != 0;
        if (!_793)
        {
            _130 = _741;
        }
        float _795 = _130;
        _785 = _795;
        float _797 = _739;
        _783 = _739;
        if (!_793)
        {
            _759 = _743;
        }
        float _799 = _759;
        bool _801 = !_793;
        float _803 = _799;
        _787 = as_type<int>(_799);
        if (!_801)
        {
            if (!_745)
            {
                _797 = _741;
            }
            float _805 = _797;
            float _807 = _805;
            float _809 = _805;
            if (!_745)
            {
                _803 = _739;
            }
            float _811 = _803;
            bool _813 = !_745;
            float _815 = _811;
            int _817 = as_type<int>(_811);
            if (!_813)
            {
                int _819 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _821 = _819 != 0;
                int _823 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _825 = _823 != 0;
                int _827 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _829 = _827 != 0;
                int _831 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _833 = _831 != 0;
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _837 = _835 != 0;
                if (_821)
                {
                    _807 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _839 = _807;
                float _841 = _839;
                if (_821)
                {
                    _815 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _843 = _815;
                float _845 = _843;
                if (!_821)
                {
                    _841 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _847 = _841;
                if (!_821)
                {
                    _845 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _849 = _845;
                float _851 = _847 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _853 = _849 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_833)
                {
                    float _855 = _851 * _741;
                    _761 = _855;
                }
                float _857 = _761;
                float _859 = -_851;
                float _861 = _859 + 1.0;
                float _863 = _857;
                if (_837)
                {
                    float _865 = _853 * _739;
                    _763 = _865;
                }
                float _867 = _763;
                float _869 = -_853;
                float _871 = _869 + 1.0;
                int _873 = as_type<int>(_867);
                if (_825)
                {
                    float _875 = _857 + _861;
                    _863 = _875;
                }
                float _877 = _863;
                if (_829)
                {
                    float _879 = _867 + _871;
                    _873 = as_type<int>(_879);
                }
                int _881 = _873;
                _817 = _881;
                _809 = _877;
            }
            int _883 = _817;
            float _885 = _809;
            int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _889 = _887 != 0;
            int _891 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _893 = _891 != 0;
            int _895 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _897 = _895 != 0;
            int _899 = as_type<int>(_885);
            int _901 = _883;
            _787 = as_type<int>(_743);
            if (_893)
            {
                float _903 = -_885;
                float _905 = _903 + 1.0;
                _899 = as_type<int>(_905);
            }
            int _907 = _899;
            if (_897)
            {
                float _909 = -as_type<float>(_883);
                float _911 = _909 + 1.0;
                _901 = as_type<int>(_911);
            }
            int _913 = _901;
            bool _915 = !_889;
            float _917 = _915 ? as_type<float>(_907) : as_type<float>(_913);
            bool _919 = !_889;
            float _921 = _919 ? as_type<float>(_913) : as_type<float>(_907);
            _783 = _921;
            _785 = _917;
        }
    }
    _789 = false;
    float _923 = _783;
    float _925 = _785;
    int _927 = _787;
    float _929 = _923 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _931 = _923 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _933 = _747 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _935 = _749 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c3)._m0[8].x, _929);
    float _939 = fma(_925, (*spvDescriptorSet0.vp_c3)._m0[7].x, _931);
    float _941 = _751 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _943 = _753 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    out.m_27.w = as_type<float>(_927);
    float _949 = -_945;
    float _951 = _949 + 1.0;
    out.m_29.x = _933;
    out.m_29.y = _935;
    out.m_29.z = _941;
    out.m_29.w = _943;
    out.m_27.x = _947;
    out.m_27.y = _951;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _789 = false;
    bool _158 = false;
    bool _323 = false;
    bool _321 = false;
    bool _317 = false;
    bool _313 = false;
    bool _309 = false;
    bool _305 = false;
    bool _301 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    bool _110 = !_108;
    float _112 = _87;
    float _114 = _65;
    float _116 = _89;
    float _118 = _95;
    float _120 = _97;
    float _122 = _99;
    float _124 = _101;
    float _126 = _45;
    float _128 = _43;
    float _130 = _49;
    bool _136;
    float _140;
    float _144;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _112 = 1.0;
        }
        float _138 = _112;
        _140 = _138;
        if (_134)
        {
            _114 = 255.0;
        }
        float _142 = _114;
        _144 = _142;
        if (_134)
        {
            _116 = 255.0;
        }
        float _146 = _116;
        _148 = _146;
        if (_134)
        {
            _118 = 255.0;
        }
        float _150 = _118;
        _152 = _150;
        if (_134)
        {
            _120 = 255.0;
        }
        float _154 = _120;
        _156 = _154;
        _158 = _134;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            bool _174 = _172 == 0;
            bool _176 = _172 == 16;
            bool _178 = _172 == 32;
            bool _180 = _172 == 48;
            float _182 = as_type<float>(_162);
            float _184 = as_type<float>(_166);
            float _186 = as_type<float>(_172);
            _144 = 255.0;
            _148 = 255.0;
            _152 = 255.0;
            _156 = 255.0;
            if (_174)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _188 = _182;
            float _190 = _188;
            if (_174)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _192 = _184;
            float _194 = _192;
            if (_174)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _196 = _186;
            float _198 = _196;
            if (_176)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _200 = _190;
            float _202 = _200;
            if (_176)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _204 = _194;
            float _206 = _204;
            if (_176)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _208 = _198;
            float _210 = _208;
            if (_178)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _212 = _202;
            float _214 = _212;
            if (_178)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _216 = _206;
            float _218 = _216;
            if (_178)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _220 = _210;
            float _222 = _220;
            if (_180)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _224 = _214;
            _128 = _224;
            if (_180)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _226 = _218;
            _126 = _226;
            if (_180)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _228 = _222;
            _140 = _228;
            _158 = true;
        }
    }
    else
    {
        int _230 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _232 = _230 != 0;
        uint _235 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _237 = int(_235) & 15;
        bool _239 = !_232;
        float _241 = as_type<float>(_237);
        _136 = _232;
        if (!_239)
        {
            uint _243 = min(uint(_237), 13u);
            float _245 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _247 = int(_243) << 2;
            uint _249 = uint(int(uint(_247) >> uint(2)));
            uint _251 = uint(int(uint(int(_249)) >> uint(2)));
            int _253 = int(_249) & 3;
            float _255 = (*spvDescriptorSet0.vp_c1)._m0[int(_251)][_253];
            float _257 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _259 = _245 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _261 = _245 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _263 = _257 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _265 = _257 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _267 = as_type<int>(_255) >> 31;
            bool _269 = as_type<int>(_255) == 1296;
            float _271 = as_type<float>(_267);
            float _273 = _261;
            float _275 = _255;
            float _277 = _265;
            if (!_269)
            {
                bool _279 = as_type<int>(_255) == 1344;
                _281 = _279;
                if (!_281)
                {
                    bool _283 = as_type<int>(_255) == 1408;
                    _285 = _283;
                    if (!_285)
                    {
                        bool _287 = as_type<int>(_255) == 1472;
                        _289 = _287;
                        if (!_289)
                        {
                            bool _291 = as_type<int>(_255) == 1552;
                            _293 = _291;
                            if (!_293)
                            {
                                bool _295 = as_type<int>(_255) == 1632;
                                _297 = _295;
                                if (!_297)
                                {
                                    bool _299 = as_type<int>(_255) == 1728;
                                    _301 = _299;
                                    if (!_301)
                                    {
                                        bool _303 = as_type<int>(_255) == 1808;
                                        _305 = _303;
                                        if (!_305)
                                        {
                                            bool _307 = as_type<int>(_255) == 1904;
                                            _309 = _307;
                                            if (!_309)
                                            {
                                                bool _311 = as_type<int>(_255) == 1968;
                                                _313 = _311;
                                                if (!_313)
                                                {
                                                    bool _315 = as_type<int>(_255) == 2048;
                                                    _317 = _315;
                                                    if (!_317)
                                                    {
                                                        bool _319 = as_type<int>(_255) == 2112;
                                                        _321 = _319;
                                                        if (!_321)
                                                        {
                                                            _323 = true;
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
            float _329;
            float _331;
            if (!_281)
            {
                if (!_285)
                {
                    if (!_289)
                    {
                        if (!_293)
                        {
                            if (!_297)
                            {
                                if (!_301)
                                {
                                    if (!_305)
                                    {
                                        if (!_309)
                                        {
                                            if (!_313)
                                            {
                                                if (!_317)
                                                {
                                                    if (!_321)
                                                    {
                                                        if (!_323)
                                                        {
                                                            float _325 = _259 * _43;
                                                            float _327 = _263 * _45;
                                                            _329 = _327;
                                                            _331 = _325;
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
            if ((((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285) || _281)
            {
                if ((!_285) || _281)
                {
                    if ((!_289) || _281)
                    {
                        if ((!_293) || _281)
                        {
                            if ((!_297) || _281)
                            {
                                if ((!_301) || _281)
                                {
                                    if ((!_305) || _281)
                                    {
                                        if ((!_309) || _281)
                                        {
                                            if ((!_313) || _281)
                                            {
                                                if ((!_317) || _281)
                                                {
                                                    if ((!_321) || _281)
                                                    {
                                                        if ((!_323) || _281)
                                                        {
                                                            _281 = false;
                                                            float _333 = -_261;
                                                            float _335 = _333 + 1.0;
                                                            float _337 = _263 * _45;
                                                            float _339 = fma(_261, _43, _335);
                                                            _329 = _337;
                                                            _331 = _339;
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
                if (((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285)
                {
                    if ((!_289) || _285)
                    {
                        if ((!_293) || _285)
                        {
                            if ((!_297) || _285)
                            {
                                if ((!_301) || _285)
                                {
                                    if ((!_305) || _285)
                                    {
                                        if ((!_309) || _285)
                                        {
                                            if ((!_313) || _285)
                                            {
                                                if ((!_317) || _285)
                                                {
                                                    if ((!_321) || _285)
                                                    {
                                                        if ((!_323) || _285)
                                                        {
                                                            _285 = false;
                                                            float _341 = -_265;
                                                            float _343 = _341 + 1.0;
                                                            float _345 = _259 * _43;
                                                            float _347 = fma(_265, _45, _343);
                                                            _329 = _347;
                                                            _331 = _345;
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
                    if ((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289)
                    {
                        if ((!_293) || _289)
                        {
                            if ((!_297) || _289)
                            {
                                if ((!_301) || _289)
                                {
                                    if ((!_305) || _289)
                                    {
                                        if ((!_309) || _289)
                                        {
                                            if ((!_313) || _289)
                                            {
                                                if ((!_317) || _289)
                                                {
                                                    if ((!_321) || _289)
                                                    {
                                                        if ((!_323) || _289)
                                                        {
                                                            _289 = false;
                                                            float _349 = -_261;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_265;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = fma(_261, _43, _351);
                                                            float _359 = fma(_265, _45, _355);
                                                            _329 = _359;
                                                            _331 = _357;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293)
                        {
                            if ((!_297) || _293)
                            {
                                if ((!_301) || _293)
                                {
                                    if ((!_305) || _293)
                                    {
                                        if ((!_309) || _293)
                                        {
                                            if ((!_313) || _293)
                                            {
                                                if ((!_317) || _293)
                                                {
                                                    if ((!_321) || _293)
                                                    {
                                                        if ((!_323) || _293)
                                                        {
                                                            _293 = false;
                                                            float _361 = -_263;
                                                            float _363 = _361 + 1.0;
                                                            float _365 = _259 * _43;
                                                            float _367 = -_265;
                                                            float _369 = _367 + _363;
                                                            float _371 = fma(_369, _45, _263);
                                                            _329 = _371;
                                                            _331 = _365;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297)
                            {
                                if ((!_301) || _297)
                                {
                                    if ((!_305) || _297)
                                    {
                                        if ((!_309) || _297)
                                        {
                                            if ((!_313) || _297)
                                            {
                                                if ((!_317) || _297)
                                                {
                                                    if ((!_321) || _297)
                                                    {
                                                        if ((!_323) || _297)
                                                        {
                                                            _297 = false;
                                                            float _373 = -_263;
                                                            float _375 = _373 + 1.0;
                                                            float _377 = -_261;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_265;
                                                            float _383 = _381 + _375;
                                                            float _385 = fma(_261, _43, _379);
                                                            float _387 = fma(_383, _45, _263);
                                                            _329 = _387;
                                                            _331 = _385;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301)
                                {
                                    if ((!_305) || _301)
                                    {
                                        if ((!_309) || _301)
                                        {
                                            if ((!_313) || _301)
                                            {
                                                if ((!_317) || _301)
                                                {
                                                    if ((!_321) || _301)
                                                    {
                                                        if ((!_323) || _301)
                                                        {
                                                            _301 = false;
                                                            float _389 = -_259;
                                                            float _391 = _389 + 1.0;
                                                            float _393 = _263 * _45;
                                                            float _395 = -_261;
                                                            float _397 = _395 + _391;
                                                            float _399 = fma(_397, _43, _259);
                                                            _329 = _393;
                                                            _331 = _399;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _323) || _321) || _317) || _313) || _309) || _305)
                                    {
                                        if ((!_309) || _305)
                                        {
                                            if ((!_313) || _305)
                                            {
                                                if ((!_317) || _305)
                                                {
                                                    if ((!_321) || _305)
                                                    {
                                                        if ((!_323) || _305)
                                                        {
                                                            _305 = false;
                                                            float _401 = -_259;
                                                            float _403 = _401 + 1.0;
                                                            float _405 = -_265;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = -_261;
                                                            float _411 = _409 + _403;
                                                            float _413 = fma(_265, _45, _407);
                                                            float _415 = fma(_411, _43, _259);
                                                            _329 = _413;
                                                            _331 = _415;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _323) || _321) || _317) || _313) || _309)
                                        {
                                            if ((!_313) || _309)
                                            {
                                                if ((!_317) || _309)
                                                {
                                                    if ((!_321) || _309)
                                                    {
                                                        if ((!_323) || _309)
                                                        {
                                                            _309 = false;
                                                            float _417 = -_261;
                                                            float _419 = _417 + 1.0;
                                                            float _421 = _263 * _45;
                                                            float _423 = _419 * _43;
                                                            _329 = _421;
                                                            _331 = _423;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _323) || _321) || _317) || _313)
                                            {
                                                if ((!_317) || _313)
                                                {
                                                    if ((!_321) || _313)
                                                    {
                                                        if ((!_323) || _313)
                                                        {
                                                            _313 = false;
                                                            float _425 = -_261;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = -_265;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = fma(_261, _43, _427);
                                                            float _435 = _431 * _45;
                                                            _329 = _435;
                                                            _331 = _433;
                                                        }
                                                    }
                                                }
                                                if (((false || _323) || _321) || _317)
                                                {
                                                    if ((!_321) || _317)
                                                    {
                                                        if ((!_323) || _317)
                                                        {
                                                            _317 = false;
                                                            float _437 = -_263;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = _259 * _43;
                                                            float _443 = fma(_439, _45, _263);
                                                            _329 = _443;
                                                            _331 = _441;
                                                        }
                                                    }
                                                    if ((false || _323) || _321)
                                                    {
                                                        if ((!_323) || _321)
                                                        {
                                                            _321 = false;
                                                            float _445 = -_259;
                                                            float _447 = _445 + 1.0;
                                                            float _449 = -_265;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = fma(_447, _43, _259);
                                                            float _455 = fma(_265, _45, _451);
                                                            _329 = _455;
                                                            _331 = _453;
                                                        }
                                                        if (false || _323)
                                                        {
                                                            _323 = false;
                                                            bool _457 = _237 != 12;
                                                            if (!_457)
                                                            {
                                                                float _459 = -_263;
                                                                float _461 = _459 + 1.0;
                                                                _271 = _461;
                                                            }
                                                            float _463 = _271;
                                                            if (!_457)
                                                            {
                                                                float _465 = -_261;
                                                                float _467 = _465 + 1.0;
                                                                _273 = _467;
                                                            }
                                                            float _469 = _273;
                                                            if (_457)
                                                            {
                                                                _275 = 0.0;
                                                            }
                                                            float _471 = _275;
                                                            float _473 = _471;
                                                            if (!_457)
                                                            {
                                                                float _475 = -_265;
                                                                float _477 = _475 + _463;
                                                                _277 = _477;
                                                            }
                                                            float _479 = _277;
                                                            if (_457)
                                                            {
                                                                _241 = 0.0;
                                                            }
                                                            float _481 = _241;
                                                            _329 = _481;
                                                            if (!_457)
                                                            {
                                                                float _483 = _43 * _469;
                                                                _473 = _483;
                                                            }
                                                            float _485 = _473;
                                                            _331 = _485;
                                                            if (!_457)
                                                            {
                                                                float _487 = _45 * _479;
                                                                _329 = _487;
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
            float _489 = _329;
            float _491 = _331;
            float _493 = -_489;
            float _495 = _493 + 1.0;
            float _497 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _499 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _501 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _503 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _505 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _507 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _509 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _511 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _513 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].x, _497);
            float _515 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].x, _499);
            float _517 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].y, _501);
            float _519 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].y, _503);
            float _521 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].z, _505);
            float _523 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].z, _507);
            float _525 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].w, _509);
            float _527 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].w, _511);
            float _529 = -_491;
            float _531 = _529 + 1.0;
            float _533 = _513 * _491;
            float _535 = _517 * _491;
            float _537 = _521 * _491;
            float _539 = _527 * _491;
            float _541 = fma(_531, _515, _533);
            float _543 = fma(_531, _519, _535);
            float _545 = fma(_531, _523, _537);
            float _547 = fma(_531, _525, _539);
            _140 = 1.0;
            _144 = _541;
            _148 = _543;
            _152 = _545;
            _156 = _547;
            _158 = true;
        }
        else
        {
            float _549 = trunc(_43);
            int _551 = int(_549);
            float _553 = trunc(_45);
            int _555 = int(_553);
            int _557 = _555 << 1;
            int _559 = _557 + _551;
            int _561 = _559 << 4;
            bool _563 = _561 == 0;
            bool _565 = _561 == 16;
            bool _567 = _561 == 32;
            bool _569 = _561 == 48;
            if (_563)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _571 = _122;
            float _573 = _571;
            if (_563)
            {
                _124 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _575 = _124;
            float _577 = 0.0;
            float _579 = _575;
            if (_563)
            {
                _577 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _581 = _577;
            bool _583 = _237 != 13;
            float _585 = _581;
            if (_565)
            {
                _573 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _587 = _573;
            float _589 = _587;
            if (_565)
            {
                _579 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _591 = _579;
            float _593 = _591;
            if (_565)
            {
                _585 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _595 = _585;
            float _597 = _595;
            if (_567)
            {
                _589 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _599 = _589;
            float _601 = _599;
            if (_567)
            {
                _593 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _603 = _593;
            float _605 = _603;
            if (_567)
            {
                _597 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _607 = _597;
            float _609 = _607;
            if (_569)
            {
                _601 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _611 = _601;
            if (_569)
            {
                _605 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _613 = _605;
            if (_569)
            {
                _609 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _615 = _609;
            if (!_583)
            {
                float _617 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _619 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _621 = _617 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _623 = -_621;
                float _625 = _623 + 1.0;
                float _627 = _619 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _629 = -_617;
                float _631 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[26].w, _625);
                float _633 = -_627;
                float _635 = _633 + 1.0;
                float _637 = fma(_631, _45, _621);
                float _639 = -_619;
                float _641 = fma(_639, (*spvDescriptorSet0.vp_c3)._m0[26].y, _635);
                float _643 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _645 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _647 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _649 = fma(_641, _43, _627);
                float _651 = -_637;
                float _653 = _651 + 1.0;
                float _655 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _657 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _659 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _661 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _663 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _665 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].y, _643);
                float _667 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].x, _645);
                float _669 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].x, _647);
                float _671 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].y, _655);
                float _673 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].z, _657);
                float _675 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].z, _659);
                float _677 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].w, _661);
                float _679 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].w, _663);
                float _681 = -_649;
                float _683 = _681 + 1.0;
                float _685 = _649 * _665;
                float _687 = _649 * _667;
                float _689 = _649 * _673;
                float _691 = _649 * _679;
                float _693 = fma(_683, _671, _685);
                float _695 = fma(_683, _669, _687);
                float _697 = fma(_683, _675, _689);
                float _699 = fma(_683, _677, _691);
                _126 = _613;
                _128 = _611;
                _140 = _615;
                _144 = _695;
                _148 = _693;
                _152 = _697;
                _156 = _699;
                _158 = true;
            }
            else
            {
                int _701 = _559 << 4;
                int _703 = _701 + 464;
                uint _705 = uint(int(uint(_703) >> uint(2)));
                uint _707 = uint(int(uint(int(_705)) >> uint(2)));
                int _709 = int(_705) & 3;
                float _711 = (*spvDescriptorSet0.vp_c3)._m0[int(_707)][_709];
                int _713 = int(_705) + 1;
                uint _715 = uint(int(uint(_713) >> uint(2)));
                int _717 = _713 & 3;
                float _719 = (*spvDescriptorSet0.vp_c3)._m0[int(_715)][_717];
                int _721 = _703 + 8;
                uint _723 = uint(int(uint(_721) >> uint(2)));
                uint _725 = uint(int(uint(int(_723)) >> uint(2)));
                int _727 = int(_723) & 3;
                float _729 = (*spvDescriptorSet0.vp_c3)._m0[int(_725)][_727];
                int _731 = int(_723) + 1;
                uint _733 = uint(int(uint(_731) >> uint(2)));
                int _735 = _731 & 3;
                float _737 = (*spvDescriptorSet0.vp_c3)._m0[int(_733)][_735];
                _126 = _613;
                _128 = _611;
                _140 = _615;
                _144 = _711;
                _148 = _719;
                _152 = _729;
                _156 = _737;
            }
        }
    }
    _158 = false;
    float _739 = _126;
    float _741 = _128;
    float _743 = _140;
    bool _745 = _136;
    float _747 = _144;
    float _749 = _148;
    float _751 = _152;
    float _753 = _156;
    bool _755 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _757 = !_755;
    float _759 = _741;
    float _761 = _741;
    float _763 = _739;
    float _783;
    float _785;
    int _787;
    if (!_757)
    {
        float _765 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _767 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _769 = _49 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _771 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _765);
        float _773 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _767);
        float _775 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[17].x, _769);
        float _777 = _771 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _779 = _773 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _781 = _775 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _783 = _779;
        _785 = _777;
        _787 = as_type<int>(_781);
        _789 = true;
    }
    else
    {
        int _791 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _793 = _791 != 0;
        if (!_793)
        {
            _130 = _741;
        }
        float _795 = _130;
        _785 = _795;
        float _797 = _739;
        _783 = _739;
        if (!_793)
        {
            _759 = _743;
        }
        float _799 = _759;
        bool _801 = !_793;
        float _803 = _799;
        _787 = as_type<int>(_799);
        if (!_801)
        {
            if (!_745)
            {
                _797 = _741;
            }
            float _805 = _797;
            float _807 = _805;
            float _809 = _805;
            if (!_745)
            {
                _803 = _739;
            }
            float _811 = _803;
            bool _813 = !_745;
            float _815 = _811;
            int _817 = as_type<int>(_811);
            if (!_813)
            {
                int _819 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _821 = _819 != 0;
                int _823 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _825 = _823 != 0;
                int _827 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _829 = _827 != 0;
                int _831 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _833 = _831 != 0;
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _837 = _835 != 0;
                if (_821)
                {
                    _807 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _839 = _807;
                float _841 = _839;
                if (_821)
                {
                    _815 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _843 = _815;
                float _845 = _843;
                if (!_821)
                {
                    _841 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _847 = _841;
                if (!_821)
                {
                    _845 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _849 = _845;
                float _851 = _847 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _853 = _849 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_833)
                {
                    float _855 = _851 * _741;
                    _761 = _855;
                }
                float _857 = _761;
                float _859 = -_851;
                float _861 = _859 + 1.0;
                float _863 = _857;
                if (_837)
                {
                    float _865 = _853 * _739;
                    _763 = _865;
                }
                float _867 = _763;
                float _869 = -_853;
                float _871 = _869 + 1.0;
                int _873 = as_type<int>(_867);
                if (_825)
                {
                    float _875 = _857 + _861;
                    _863 = _875;
                }
                float _877 = _863;
                if (_829)
                {
                    float _879 = _867 + _871;
                    _873 = as_type<int>(_879);
                }
                int _881 = _873;
                _817 = _881;
                _809 = _877;
            }
            int _883 = _817;
            float _885 = _809;
            int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _889 = _887 != 0;
            int _891 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _893 = _891 != 0;
            int _895 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _897 = _895 != 0;
            int _899 = as_type<int>(_885);
            int _901 = _883;
            _787 = as_type<int>(_743);
            if (_893)
            {
                float _903 = -_885;
                float _905 = _903 + 1.0;
                _899 = as_type<int>(_905);
            }
            int _907 = _899;
            if (_897)
            {
                float _909 = -as_type<float>(_883);
                float _911 = _909 + 1.0;
                _901 = as_type<int>(_911);
            }
            int _913 = _901;
            bool _915 = !_889;
            float _917 = _915 ? as_type<float>(_907) : as_type<float>(_913);
            bool _919 = !_889;
            float _921 = _919 ? as_type<float>(_913) : as_type<float>(_907);
            _783 = _921;
            _785 = _917;
        }
    }
    _789 = false;
    float _923 = _783;
    float _925 = _785;
    int _927 = _787;
    float _929 = _923 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _931 = _923 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _933 = _747 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _935 = _749 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c3)._m0[8].x, _929);
    float _939 = fma(_925, (*spvDescriptorSet0.vp_c3)._m0[7].x, _931);
    float _941 = _751 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _943 = _753 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    out.m_27.w = as_type<float>(_927);
    float _949 = -_945;
    float _951 = _949 + 1.0;
    out.m_29.x = _933;
    out.m_29.y = _935;
    out.m_29.z = _941;
    out.m_29.w = _943;
    out.m_27.x = _947;
    out.m_27.y = _951;
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
    bool _789 = false;
    bool _158 = false;
    bool _323 = false;
    bool _321 = false;
    bool _317 = false;
    bool _313 = false;
    bool _309 = false;
    bool _305 = false;
    bool _301 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    bool _110 = !_108;
    float _112 = _87;
    float _114 = _65;
    float _116 = _89;
    float _118 = _95;
    float _120 = _97;
    float _122 = _99;
    float _124 = _101;
    float _126 = _45;
    float _128 = _43;
    float _130 = _49;
    bool _136;
    float _140;
    float _144;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _112 = 1.0;
        }
        float _138 = _112;
        _140 = _138;
        if (_134)
        {
            _114 = 255.0;
        }
        float _142 = _114;
        _144 = _142;
        if (_134)
        {
            _116 = 255.0;
        }
        float _146 = _116;
        _148 = _146;
        if (_134)
        {
            _118 = 255.0;
        }
        float _150 = _118;
        _152 = _150;
        if (_134)
        {
            _120 = 255.0;
        }
        float _154 = _120;
        _156 = _154;
        _158 = _134;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            bool _174 = _172 == 0;
            bool _176 = _172 == 16;
            bool _178 = _172 == 32;
            bool _180 = _172 == 48;
            float _182 = as_type<float>(_162);
            float _184 = as_type<float>(_166);
            float _186 = as_type<float>(_172);
            _144 = 255.0;
            _148 = 255.0;
            _152 = 255.0;
            _156 = 255.0;
            if (_174)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _188 = _182;
            float _190 = _188;
            if (_174)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _192 = _184;
            float _194 = _192;
            if (_174)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _196 = _186;
            float _198 = _196;
            if (_176)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _200 = _190;
            float _202 = _200;
            if (_176)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _204 = _194;
            float _206 = _204;
            if (_176)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _208 = _198;
            float _210 = _208;
            if (_178)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _212 = _202;
            float _214 = _212;
            if (_178)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _216 = _206;
            float _218 = _216;
            if (_178)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _220 = _210;
            float _222 = _220;
            if (_180)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _224 = _214;
            _128 = _224;
            if (_180)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _226 = _218;
            _126 = _226;
            if (_180)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _228 = _222;
            _140 = _228;
            _158 = true;
        }
    }
    else
    {
        int _230 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _232 = _230 != 0;
        uint _235 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _237 = int(_235) & 15;
        bool _239 = !_232;
        float _241 = as_type<float>(_237);
        _136 = _232;
        if (!_239)
        {
            uint _243 = min(uint(_237), 13u);
            float _245 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _247 = int(_243) << 2;
            uint _249 = uint(int(uint(_247) >> uint(2)));
            uint _251 = uint(int(uint(int(_249)) >> uint(2)));
            int _253 = int(_249) & 3;
            float _255 = (*spvDescriptorSet0.vp_c1)._m0[int(_251)][_253];
            float _257 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _259 = _245 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _261 = _245 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _263 = _257 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _265 = _257 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _267 = as_type<int>(_255) >> 31;
            bool _269 = as_type<int>(_255) == 1296;
            float _271 = as_type<float>(_267);
            float _273 = _261;
            float _275 = _255;
            float _277 = _265;
            if (!_269)
            {
                bool _279 = as_type<int>(_255) == 1344;
                _281 = _279;
                if (!_281)
                {
                    bool _283 = as_type<int>(_255) == 1408;
                    _285 = _283;
                    if (!_285)
                    {
                        bool _287 = as_type<int>(_255) == 1472;
                        _289 = _287;
                        if (!_289)
                        {
                            bool _291 = as_type<int>(_255) == 1552;
                            _293 = _291;
                            if (!_293)
                            {
                                bool _295 = as_type<int>(_255) == 1632;
                                _297 = _295;
                                if (!_297)
                                {
                                    bool _299 = as_type<int>(_255) == 1728;
                                    _301 = _299;
                                    if (!_301)
                                    {
                                        bool _303 = as_type<int>(_255) == 1808;
                                        _305 = _303;
                                        if (!_305)
                                        {
                                            bool _307 = as_type<int>(_255) == 1904;
                                            _309 = _307;
                                            if (!_309)
                                            {
                                                bool _311 = as_type<int>(_255) == 1968;
                                                _313 = _311;
                                                if (!_313)
                                                {
                                                    bool _315 = as_type<int>(_255) == 2048;
                                                    _317 = _315;
                                                    if (!_317)
                                                    {
                                                        bool _319 = as_type<int>(_255) == 2112;
                                                        _321 = _319;
                                                        if (!_321)
                                                        {
                                                            _323 = true;
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
            float _329;
            float _331;
            if (!_281)
            {
                if (!_285)
                {
                    if (!_289)
                    {
                        if (!_293)
                        {
                            if (!_297)
                            {
                                if (!_301)
                                {
                                    if (!_305)
                                    {
                                        if (!_309)
                                        {
                                            if (!_313)
                                            {
                                                if (!_317)
                                                {
                                                    if (!_321)
                                                    {
                                                        if (!_323)
                                                        {
                                                            float _325 = _259 * _43;
                                                            float _327 = _263 * _45;
                                                            _329 = _327;
                                                            _331 = _325;
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
            if ((((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285) || _281)
            {
                if ((!_285) || _281)
                {
                    if ((!_289) || _281)
                    {
                        if ((!_293) || _281)
                        {
                            if ((!_297) || _281)
                            {
                                if ((!_301) || _281)
                                {
                                    if ((!_305) || _281)
                                    {
                                        if ((!_309) || _281)
                                        {
                                            if ((!_313) || _281)
                                            {
                                                if ((!_317) || _281)
                                                {
                                                    if ((!_321) || _281)
                                                    {
                                                        if ((!_323) || _281)
                                                        {
                                                            _281 = false;
                                                            float _333 = -_261;
                                                            float _335 = _333 + 1.0;
                                                            float _337 = _263 * _45;
                                                            float _339 = fma(_261, _43, _335);
                                                            _329 = _337;
                                                            _331 = _339;
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
                if (((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285)
                {
                    if ((!_289) || _285)
                    {
                        if ((!_293) || _285)
                        {
                            if ((!_297) || _285)
                            {
                                if ((!_301) || _285)
                                {
                                    if ((!_305) || _285)
                                    {
                                        if ((!_309) || _285)
                                        {
                                            if ((!_313) || _285)
                                            {
                                                if ((!_317) || _285)
                                                {
                                                    if ((!_321) || _285)
                                                    {
                                                        if ((!_323) || _285)
                                                        {
                                                            _285 = false;
                                                            float _341 = -_265;
                                                            float _343 = _341 + 1.0;
                                                            float _345 = _259 * _43;
                                                            float _347 = fma(_265, _45, _343);
                                                            _329 = _347;
                                                            _331 = _345;
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
                    if ((((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289)
                    {
                        if ((!_293) || _289)
                        {
                            if ((!_297) || _289)
                            {
                                if ((!_301) || _289)
                                {
                                    if ((!_305) || _289)
                                    {
                                        if ((!_309) || _289)
                                        {
                                            if ((!_313) || _289)
                                            {
                                                if ((!_317) || _289)
                                                {
                                                    if ((!_321) || _289)
                                                    {
                                                        if ((!_323) || _289)
                                                        {
                                                            _289 = false;
                                                            float _349 = -_261;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_265;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = fma(_261, _43, _351);
                                                            float _359 = fma(_265, _45, _355);
                                                            _329 = _359;
                                                            _331 = _357;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293)
                        {
                            if ((!_297) || _293)
                            {
                                if ((!_301) || _293)
                                {
                                    if ((!_305) || _293)
                                    {
                                        if ((!_309) || _293)
                                        {
                                            if ((!_313) || _293)
                                            {
                                                if ((!_317) || _293)
                                                {
                                                    if ((!_321) || _293)
                                                    {
                                                        if ((!_323) || _293)
                                                        {
                                                            _293 = false;
                                                            float _361 = -_263;
                                                            float _363 = _361 + 1.0;
                                                            float _365 = _259 * _43;
                                                            float _367 = -_265;
                                                            float _369 = _367 + _363;
                                                            float _371 = fma(_369, _45, _263);
                                                            _329 = _371;
                                                            _331 = _365;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301) || _297)
                            {
                                if ((!_301) || _297)
                                {
                                    if ((!_305) || _297)
                                    {
                                        if ((!_309) || _297)
                                        {
                                            if ((!_313) || _297)
                                            {
                                                if ((!_317) || _297)
                                                {
                                                    if ((!_321) || _297)
                                                    {
                                                        if ((!_323) || _297)
                                                        {
                                                            _297 = false;
                                                            float _373 = -_263;
                                                            float _375 = _373 + 1.0;
                                                            float _377 = -_261;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_265;
                                                            float _383 = _381 + _375;
                                                            float _385 = fma(_261, _43, _379);
                                                            float _387 = fma(_383, _45, _263);
                                                            _329 = _387;
                                                            _331 = _385;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _323) || _321) || _317) || _313) || _309) || _305) || _301)
                                {
                                    if ((!_305) || _301)
                                    {
                                        if ((!_309) || _301)
                                        {
                                            if ((!_313) || _301)
                                            {
                                                if ((!_317) || _301)
                                                {
                                                    if ((!_321) || _301)
                                                    {
                                                        if ((!_323) || _301)
                                                        {
                                                            _301 = false;
                                                            float _389 = -_259;
                                                            float _391 = _389 + 1.0;
                                                            float _393 = _263 * _45;
                                                            float _395 = -_261;
                                                            float _397 = _395 + _391;
                                                            float _399 = fma(_397, _43, _259);
                                                            _329 = _393;
                                                            _331 = _399;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _323) || _321) || _317) || _313) || _309) || _305)
                                    {
                                        if ((!_309) || _305)
                                        {
                                            if ((!_313) || _305)
                                            {
                                                if ((!_317) || _305)
                                                {
                                                    if ((!_321) || _305)
                                                    {
                                                        if ((!_323) || _305)
                                                        {
                                                            _305 = false;
                                                            float _401 = -_259;
                                                            float _403 = _401 + 1.0;
                                                            float _405 = -_265;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = -_261;
                                                            float _411 = _409 + _403;
                                                            float _413 = fma(_265, _45, _407);
                                                            float _415 = fma(_411, _43, _259);
                                                            _329 = _413;
                                                            _331 = _415;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _323) || _321) || _317) || _313) || _309)
                                        {
                                            if ((!_313) || _309)
                                            {
                                                if ((!_317) || _309)
                                                {
                                                    if ((!_321) || _309)
                                                    {
                                                        if ((!_323) || _309)
                                                        {
                                                            _309 = false;
                                                            float _417 = -_261;
                                                            float _419 = _417 + 1.0;
                                                            float _421 = _263 * _45;
                                                            float _423 = _419 * _43;
                                                            _329 = _421;
                                                            _331 = _423;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _323) || _321) || _317) || _313)
                                            {
                                                if ((!_317) || _313)
                                                {
                                                    if ((!_321) || _313)
                                                    {
                                                        if ((!_323) || _313)
                                                        {
                                                            _313 = false;
                                                            float _425 = -_261;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = -_265;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = fma(_261, _43, _427);
                                                            float _435 = _431 * _45;
                                                            _329 = _435;
                                                            _331 = _433;
                                                        }
                                                    }
                                                }
                                                if (((false || _323) || _321) || _317)
                                                {
                                                    if ((!_321) || _317)
                                                    {
                                                        if ((!_323) || _317)
                                                        {
                                                            _317 = false;
                                                            float _437 = -_263;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = _259 * _43;
                                                            float _443 = fma(_439, _45, _263);
                                                            _329 = _443;
                                                            _331 = _441;
                                                        }
                                                    }
                                                    if ((false || _323) || _321)
                                                    {
                                                        if ((!_323) || _321)
                                                        {
                                                            _321 = false;
                                                            float _445 = -_259;
                                                            float _447 = _445 + 1.0;
                                                            float _449 = -_265;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = fma(_447, _43, _259);
                                                            float _455 = fma(_265, _45, _451);
                                                            _329 = _455;
                                                            _331 = _453;
                                                        }
                                                        if (false || _323)
                                                        {
                                                            _323 = false;
                                                            bool _457 = _237 != 12;
                                                            if (!_457)
                                                            {
                                                                float _459 = -_263;
                                                                float _461 = _459 + 1.0;
                                                                _271 = _461;
                                                            }
                                                            float _463 = _271;
                                                            if (!_457)
                                                            {
                                                                float _465 = -_261;
                                                                float _467 = _465 + 1.0;
                                                                _273 = _467;
                                                            }
                                                            float _469 = _273;
                                                            if (_457)
                                                            {
                                                                _275 = 0.0;
                                                            }
                                                            float _471 = _275;
                                                            float _473 = _471;
                                                            if (!_457)
                                                            {
                                                                float _475 = -_265;
                                                                float _477 = _475 + _463;
                                                                _277 = _477;
                                                            }
                                                            float _479 = _277;
                                                            if (_457)
                                                            {
                                                                _241 = 0.0;
                                                            }
                                                            float _481 = _241;
                                                            _329 = _481;
                                                            if (!_457)
                                                            {
                                                                float _483 = _43 * _469;
                                                                _473 = _483;
                                                            }
                                                            float _485 = _473;
                                                            _331 = _485;
                                                            if (!_457)
                                                            {
                                                                float _487 = _45 * _479;
                                                                _329 = _487;
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
            float _489 = _329;
            float _491 = _331;
            float _493 = -_489;
            float _495 = _493 + 1.0;
            float _497 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _499 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _501 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _503 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _505 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _507 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _509 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _511 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _513 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].x, _497);
            float _515 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].x, _499);
            float _517 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].y, _501);
            float _519 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].y, _503);
            float _521 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].z, _505);
            float _523 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].z, _507);
            float _525 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[29].w, _509);
            float _527 = fma(_495, (*spvDescriptorSet0.vp_c3)._m0[30].w, _511);
            float _529 = -_491;
            float _531 = _529 + 1.0;
            float _533 = _513 * _491;
            float _535 = _517 * _491;
            float _537 = _521 * _491;
            float _539 = _527 * _491;
            float _541 = fma(_531, _515, _533);
            float _543 = fma(_531, _519, _535);
            float _545 = fma(_531, _523, _537);
            float _547 = fma(_531, _525, _539);
            _140 = 1.0;
            _144 = _541;
            _148 = _543;
            _152 = _545;
            _156 = _547;
            _158 = true;
        }
        else
        {
            float _549 = trunc(_43);
            int _551 = int(_549);
            float _553 = trunc(_45);
            int _555 = int(_553);
            int _557 = _555 << 1;
            int _559 = _557 + _551;
            int _561 = _559 << 4;
            bool _563 = _561 == 0;
            bool _565 = _561 == 16;
            bool _567 = _561 == 32;
            bool _569 = _561 == 48;
            if (_563)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _571 = _122;
            float _573 = _571;
            if (_563)
            {
                _124 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _575 = _124;
            float _577 = 0.0;
            float _579 = _575;
            if (_563)
            {
                _577 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _581 = _577;
            bool _583 = _237 != 13;
            float _585 = _581;
            if (_565)
            {
                _573 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _587 = _573;
            float _589 = _587;
            if (_565)
            {
                _579 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _591 = _579;
            float _593 = _591;
            if (_565)
            {
                _585 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _595 = _585;
            float _597 = _595;
            if (_567)
            {
                _589 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _599 = _589;
            float _601 = _599;
            if (_567)
            {
                _593 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _603 = _593;
            float _605 = _603;
            if (_567)
            {
                _597 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _607 = _597;
            float _609 = _607;
            if (_569)
            {
                _601 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _611 = _601;
            if (_569)
            {
                _605 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _613 = _605;
            if (_569)
            {
                _609 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _615 = _609;
            if (!_583)
            {
                float _617 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _619 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _621 = _617 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _623 = -_621;
                float _625 = _623 + 1.0;
                float _627 = _619 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _629 = -_617;
                float _631 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[26].w, _625);
                float _633 = -_627;
                float _635 = _633 + 1.0;
                float _637 = fma(_631, _45, _621);
                float _639 = -_619;
                float _641 = fma(_639, (*spvDescriptorSet0.vp_c3)._m0[26].y, _635);
                float _643 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _645 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _647 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _649 = fma(_641, _43, _627);
                float _651 = -_637;
                float _653 = _651 + 1.0;
                float _655 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _657 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _659 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _661 = _637 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _663 = _637 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _665 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].y, _643);
                float _667 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].x, _645);
                float _669 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].x, _647);
                float _671 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].y, _655);
                float _673 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].z, _657);
                float _675 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].z, _659);
                float _677 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[29].w, _661);
                float _679 = fma(_653, (*spvDescriptorSet0.vp_c3)._m0[30].w, _663);
                float _681 = -_649;
                float _683 = _681 + 1.0;
                float _685 = _649 * _665;
                float _687 = _649 * _667;
                float _689 = _649 * _673;
                float _691 = _649 * _679;
                float _693 = fma(_683, _671, _685);
                float _695 = fma(_683, _669, _687);
                float _697 = fma(_683, _675, _689);
                float _699 = fma(_683, _677, _691);
                _126 = _613;
                _128 = _611;
                _140 = _615;
                _144 = _695;
                _148 = _693;
                _152 = _697;
                _156 = _699;
                _158 = true;
            }
            else
            {
                int _701 = _559 << 4;
                int _703 = _701 + 464;
                uint _705 = uint(int(uint(_703) >> uint(2)));
                uint _707 = uint(int(uint(int(_705)) >> uint(2)));
                int _709 = int(_705) & 3;
                float _711 = (*spvDescriptorSet0.vp_c3)._m0[int(_707)][_709];
                int _713 = int(_705) + 1;
                uint _715 = uint(int(uint(_713) >> uint(2)));
                int _717 = _713 & 3;
                float _719 = (*spvDescriptorSet0.vp_c3)._m0[int(_715)][_717];
                int _721 = _703 + 8;
                uint _723 = uint(int(uint(_721) >> uint(2)));
                uint _725 = uint(int(uint(int(_723)) >> uint(2)));
                int _727 = int(_723) & 3;
                float _729 = (*spvDescriptorSet0.vp_c3)._m0[int(_725)][_727];
                int _731 = int(_723) + 1;
                uint _733 = uint(int(uint(_731) >> uint(2)));
                int _735 = _731 & 3;
                float _737 = (*spvDescriptorSet0.vp_c3)._m0[int(_733)][_735];
                _126 = _613;
                _128 = _611;
                _140 = _615;
                _144 = _711;
                _148 = _719;
                _152 = _729;
                _156 = _737;
            }
        }
    }
    _158 = false;
    float _739 = _126;
    float _741 = _128;
    float _743 = _140;
    bool _745 = _136;
    float _747 = _144;
    float _749 = _148;
    float _751 = _152;
    float _753 = _156;
    bool _755 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _757 = !_755;
    float _759 = _741;
    float _761 = _741;
    float _763 = _739;
    float _783;
    float _785;
    int _787;
    if (!_757)
    {
        float _765 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _767 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _769 = _49 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _771 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _765);
        float _773 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _767);
        float _775 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[17].x, _769);
        float _777 = _771 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _779 = _773 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _781 = _775 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _783 = _779;
        _785 = _777;
        _787 = as_type<int>(_781);
        _789 = true;
    }
    else
    {
        int _791 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _793 = _791 != 0;
        if (!_793)
        {
            _130 = _741;
        }
        float _795 = _130;
        _785 = _795;
        float _797 = _739;
        _783 = _739;
        if (!_793)
        {
            _759 = _743;
        }
        float _799 = _759;
        bool _801 = !_793;
        float _803 = _799;
        _787 = as_type<int>(_799);
        if (!_801)
        {
            if (!_745)
            {
                _797 = _741;
            }
            float _805 = _797;
            float _807 = _805;
            float _809 = _805;
            if (!_745)
            {
                _803 = _739;
            }
            float _811 = _803;
            bool _813 = !_745;
            float _815 = _811;
            int _817 = as_type<int>(_811);
            if (!_813)
            {
                int _819 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _821 = _819 != 0;
                int _823 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _825 = _823 != 0;
                int _827 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _829 = _827 != 0;
                int _831 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _833 = _831 != 0;
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _837 = _835 != 0;
                if (_821)
                {
                    _807 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _839 = _807;
                float _841 = _839;
                if (_821)
                {
                    _815 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _843 = _815;
                float _845 = _843;
                if (!_821)
                {
                    _841 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _847 = _841;
                if (!_821)
                {
                    _845 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _849 = _845;
                float _851 = _847 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _853 = _849 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_833)
                {
                    float _855 = _851 * _741;
                    _761 = _855;
                }
                float _857 = _761;
                float _859 = -_851;
                float _861 = _859 + 1.0;
                float _863 = _857;
                if (_837)
                {
                    float _865 = _853 * _739;
                    _763 = _865;
                }
                float _867 = _763;
                float _869 = -_853;
                float _871 = _869 + 1.0;
                int _873 = as_type<int>(_867);
                if (_825)
                {
                    float _875 = _857 + _861;
                    _863 = _875;
                }
                float _877 = _863;
                if (_829)
                {
                    float _879 = _867 + _871;
                    _873 = as_type<int>(_879);
                }
                int _881 = _873;
                _817 = _881;
                _809 = _877;
            }
            int _883 = _817;
            float _885 = _809;
            int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _889 = _887 != 0;
            int _891 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _893 = _891 != 0;
            int _895 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _897 = _895 != 0;
            int _899 = as_type<int>(_885);
            int _901 = _883;
            _787 = as_type<int>(_743);
            if (_893)
            {
                float _903 = -_885;
                float _905 = _903 + 1.0;
                _899 = as_type<int>(_905);
            }
            int _907 = _899;
            if (_897)
            {
                float _909 = -as_type<float>(_883);
                float _911 = _909 + 1.0;
                _901 = as_type<int>(_911);
            }
            int _913 = _901;
            bool _915 = !_889;
            float _917 = _915 ? as_type<float>(_907) : as_type<float>(_913);
            bool _919 = !_889;
            float _921 = _919 ? as_type<float>(_913) : as_type<float>(_907);
            _783 = _921;
            _785 = _917;
        }
    }
    _789 = false;
    float _923 = _783;
    float _925 = _785;
    int _927 = _787;
    float _929 = _923 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _931 = _923 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _933 = _747 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _935 = _749 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c3)._m0[8].x, _929);
    float _939 = fma(_925, (*spvDescriptorSet0.vp_c3)._m0[7].x, _931);
    float _941 = _751 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _943 = _753 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    out.m_27.w = as_type<float>(_927);
    float _949 = -_945;
    float _951 = _949 + 1.0;
    out.m_29.x = _933;
    out.m_29.y = _935;
    out.m_29.z = _941;
    out.m_29.w = _943;
    out.m_27.x = _947;
    out.m_27.y = _951;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


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
};

struct main0_out
{
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_24 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _366 = false;
    bool _150 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = in.m_22.z;
    bool _51 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _53 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _55 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _61);
    float _69 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].z, _63);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].z, _65);
    float _73 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].z, _67);
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _81 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _83 = _75 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _85 = _75 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _75 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].x, _81);
    float _91 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].x, _83);
    float _93 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].z, _89);
    float _99 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].z, _91);
    float _101 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _107;
    out.gl_Position.y = _105;
    out.gl_Position.z = _109;
    out.gl_Position.w = _111;
    bool _113 = !_51;
    float _115 = _77;
    float _117 = _55;
    float _143;
    int _146;
    float _148;
    if (!_113)
    {
        float _119 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _121 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _123 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _125 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _119);
        float _127 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _121);
        float _129 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
        float _131 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[17].z, _125);
        float _133 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].z, _127);
        float _135 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].z, _129);
        float _137 = _131 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _139 = _133 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _141 = _135 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _143 = _141;
        _146 = as_type<int>(_137);
        _148 = _139;
        _150 = true;
    }
    else
    {
        int _152 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _154 = _152 != 0;
        float _156 = _107;
        float _158 = _105;
        if (!_154)
        {
            float _160 = in.m_24.x;
            float _162 = in.m_24.y;
            _156 = _160;
            _158 = _162;
        }
        float _164 = _156;
        float _166 = _158;
        if (!_154)
        {
            _115 = 1.0;
        }
        float _168 = _115;
        bool _170 = !_154;
        float _172 = _168;
        _143 = _166;
        _146 = as_type<int>(_168);
        _148 = _164;
        if (!_170)
        {
            int _174 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _176 = _174 != 0;
            float _178 = _164;
            float _180 = _166;
            if (!_176)
            {
                float _182 = in.m_24.x;
                float _184 = in.m_24.y;
                _178 = _182;
                _180 = _184;
            }
            float _186 = _178;
            float _188 = _180;
            bool _190 = !_176;
            float _192 = _186;
            int _194 = as_type<int>(_186);
            float _196 = _188;
            if (!_190)
            {
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _200 = _198 != 0;
                float _202 = in.m_24.x;
                float _204 = in.m_24.y;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _216 = _214 != 0;
                int _218 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _220 = _218 != 0;
                if (_200)
                {
                    _192 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _222 = _192;
                float _224 = _222;
                if (_200)
                {
                    _172 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _172;
                float _228 = _226;
                if (!_200)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _230 = _224;
                if (!_200)
                {
                    _228 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _232 = _228;
                float _234 = _230 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _236 = _232 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _238 = _202;
                float _240 = _204;
                if (_216)
                {
                    float _242 = _234 * _202;
                    _238 = _242;
                }
                float _244 = _238;
                float _246 = -_234;
                float _248 = _246 + 1.0;
                int _250 = as_type<int>(_244);
                if (_220)
                {
                    float _252 = _236 * _204;
                    _240 = _252;
                }
                float _254 = _240;
                float _256 = -_236;
                float _258 = _256 + 1.0;
                float _260 = _254;
                if (_208)
                {
                    float _262 = _244 + _248;
                    _250 = as_type<int>(_262);
                }
                int _264 = _250;
                if (_212)
                {
                    float _266 = _254 + _258;
                    _260 = _266;
                }
                float _268 = _260;
                _194 = _264;
                _196 = _268;
            }
            int _270 = _194;
            float _272 = _196;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _280 = _278 != 0;
            int _282 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _284 = _282 != 0;
            int _286 = _270;
            int _288 = as_type<int>(_272);
            _146 = 1065353216;
            if (_280)
            {
                float _290 = -as_type<float>(_270);
                float _292 = _290 + 1.0;
                _286 = as_type<int>(_292);
            }
            int _294 = _286;
            if (_284)
            {
                float _296 = -_272;
                float _298 = _296 + 1.0;
                _288 = as_type<int>(_298);
            }
            int _300 = _288;
            bool _302 = !_276;
            float _304 = _302 ? as_type<float>(_294) : as_type<float>(_300);
            bool _306 = !_276;
            float _308 = _306 ? as_type<float>(_300) : as_type<float>(_294);
            _143 = _308;
            _148 = _304;
        }
    }
    _150 = false;
    float _310 = _143;
    int _312 = _146;
    float _314 = _148;
    float _316 = _310 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _318 = _310 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_312);
    bool _320 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _322 = fma(_314, (*spvDescriptorSet0.vp_c3)._m0[8].x, _316);
    float _324 = fma(_314, (*spvDescriptorSet0.vp_c3)._m0[7].x, _318);
    float _326 = _322 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _328 = _324 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _330 = -_326;
    float _332 = _330 + 1.0;
    out.m_27.x = _328;
    out.m_27.y = _332;
    bool _334 = !_320;
    float _360;
    int _362;
    float _364;
    if (!_334)
    {
        float _336 = _53 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _338 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _340 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _342 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[21].x, _336);
        float _344 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _338);
        float _346 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _340);
        float _348 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[21].z, _342);
        float _350 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _344);
        float _352 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _346);
        float _354 = _348 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        float _356 = _350 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _358 = _352 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _360 = _358;
        _362 = as_type<int>(_354);
        _364 = _356;
        _366 = true;
    }
    else
    {
        int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _370 = _368 != 0;
        float _372 = _47;
        float _374 = as_type<float>(_312);
        if (!_370)
        {
            float _376 = in.m_24.x;
            float _378 = in.m_24.y;
            _372 = _376;
            _374 = _378;
        }
        float _380 = _372;
        float _382 = _374;
        if (!_370)
        {
            _117 = 1.0;
        }
        float _384 = _117;
        bool _386 = !_370;
        _360 = _382;
        _362 = as_type<int>(_384);
        _364 = _380;
        if (!_386)
        {
            int _388 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _390 = _388 != 0;
            float _392 = _384;
            float _394 = _53;
            if (!_390)
            {
                float _396 = in.m_24.x;
                float _398 = in.m_24.y;
                _392 = _396;
                _394 = _398;
            }
            float _400 = _392;
            float _402 = _394;
            bool _404 = !_390;
            float _406 = _402;
            float _408 = _400;
            int _410 = as_type<int>(_400);
            float _412 = _402;
            if (!_404)
            {
                float _414 = in.m_24.x;
                float _416 = in.m_24.y;
                int _418 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _420 = _418 != 0;
                int _422 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _424 = _422 != 0;
                int _426 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _428 = _426 != 0;
                int _430 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _432 = _430 != 0;
                int _434 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _436 = _434 != 0;
                if (_420)
                {
                    _406 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _438 = _406;
                float _440 = _438;
                if (_420)
                {
                    _408 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _442 = _408;
                float _444 = _442;
                if (!_420)
                {
                    _440 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _446 = _440;
                if (!_420)
                {
                    _444 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _448 = _444;
                float _450 = _446 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _452 = _448 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _454 = _414;
                float _456 = _416;
                if (_432)
                {
                    float _458 = _450 * _414;
                    _454 = _458;
                }
                float _460 = _454;
                float _462 = -_450;
                float _464 = _462 + 1.0;
                int _466 = as_type<int>(_460);
                if (_436)
                {
                    float _468 = _452 * _416;
                    _456 = _468;
                }
                float _470 = _456;
                float _472 = -_452;
                float _474 = _472 + 1.0;
                float _476 = _470;
                if (_424)
                {
                    float _478 = _460 + _464;
                    _466 = as_type<int>(_478);
                }
                int _480 = _466;
                if (_428)
                {
                    float _482 = _470 + _474;
                    _476 = _482;
                }
                float _484 = _476;
                _410 = _480;
                _412 = _484;
            }
            int _486 = _410;
            float _488 = _412;
            int _490 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _492 = _490 != 0;
            int _494 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _496 = _494 != 0;
            int _498 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _500 = _498 != 0;
            int _502 = _486;
            int _504 = as_type<int>(_488);
            _362 = 1065353216;
            if (_496)
            {
                float _506 = -as_type<float>(_486);
                float _508 = _506 + 1.0;
                _502 = as_type<int>(_508);
            }
            int _510 = _502;
            if (_500)
            {
                float _512 = -_488;
                float _514 = _512 + 1.0;
                _504 = as_type<int>(_514);
            }
            int _516 = _504;
            bool _518 = !_492;
            float _520 = _518 ? as_type<float>(_510) : as_type<float>(_516);
            bool _522 = !_492;
            float _524 = _522 ? as_type<float>(_516) : as_type<float>(_510);
            _360 = _524;
            _364 = _520;
        }
    }
    _366 = false;
    float _526 = _360;
    int _528 = _362;
    float _530 = _364;
    float _532 = _526 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _534 = _526 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_528);
    float _536 = fma(_530, (*spvDescriptorSet0.vp_c3)._m0[10].x, _532);
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c3)._m0[9].x, _534);
    float _540 = _536 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _542 = _538 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _544 = -_540;
    float _546 = _544 + 1.0;
    out.m_29.x = _542;
    out.m_29.y = _546;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _366 = false;
    bool _150 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = in.m_22.z;
    bool _51 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _53 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _55 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _61);
    float _69 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].z, _63);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].z, _65);
    float _73 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].z, _67);
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _81 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _83 = _75 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _85 = _75 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _75 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].x, _81);
    float _91 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].x, _83);
    float _93 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].z, _89);
    float _99 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].z, _91);
    float _101 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _107;
    out.gl_Position.y = _105;
    out.gl_Position.z = _109;
    out.gl_Position.w = _111;
    bool _113 = !_51;
    float _115 = _77;
    float _117 = _55;
    float _143;
    int _146;
    float _148;
    if (!_113)
    {
        float _119 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _121 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _123 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _125 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _119);
        float _127 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _121);
        float _129 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
        float _131 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[17].z, _125);
        float _133 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].z, _127);
        float _135 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].z, _129);
        float _137 = _131 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _139 = _133 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _141 = _135 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _143 = _141;
        _146 = as_type<int>(_137);
        _148 = _139;
        _150 = true;
    }
    else
    {
        int _152 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _154 = _152 != 0;
        float _156 = _107;
        float _158 = _105;
        if (!_154)
        {
            float _160 = in.m_24.x;
            float _162 = in.m_24.y;
            _156 = _160;
            _158 = _162;
        }
        float _164 = _156;
        float _166 = _158;
        if (!_154)
        {
            _115 = 1.0;
        }
        float _168 = _115;
        bool _170 = !_154;
        float _172 = _168;
        _143 = _166;
        _146 = as_type<int>(_168);
        _148 = _164;
        if (!_170)
        {
            int _174 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _176 = _174 != 0;
            float _178 = _164;
            float _180 = _166;
            if (!_176)
            {
                float _182 = in.m_24.x;
                float _184 = in.m_24.y;
                _178 = _182;
                _180 = _184;
            }
            float _186 = _178;
            float _188 = _180;
            bool _190 = !_176;
            float _192 = _186;
            int _194 = as_type<int>(_186);
            float _196 = _188;
            if (!_190)
            {
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _200 = _198 != 0;
                float _202 = in.m_24.x;
                float _204 = in.m_24.y;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _216 = _214 != 0;
                int _218 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _220 = _218 != 0;
                if (_200)
                {
                    _192 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _222 = _192;
                float _224 = _222;
                if (_200)
                {
                    _172 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _172;
                float _228 = _226;
                if (!_200)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _230 = _224;
                if (!_200)
                {
                    _228 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _232 = _228;
                float _234 = _230 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _236 = _232 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _238 = _202;
                float _240 = _204;
                if (_216)
                {
                    float _242 = _234 * _202;
                    _238 = _242;
                }
                float _244 = _238;
                float _246 = -_234;
                float _248 = _246 + 1.0;
                int _250 = as_type<int>(_244);
                if (_220)
                {
                    float _252 = _236 * _204;
                    _240 = _252;
                }
                float _254 = _240;
                float _256 = -_236;
                float _258 = _256 + 1.0;
                float _260 = _254;
                if (_208)
                {
                    float _262 = _244 + _248;
                    _250 = as_type<int>(_262);
                }
                int _264 = _250;
                if (_212)
                {
                    float _266 = _254 + _258;
                    _260 = _266;
                }
                float _268 = _260;
                _194 = _264;
                _196 = _268;
            }
            int _270 = _194;
            float _272 = _196;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _280 = _278 != 0;
            int _282 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _284 = _282 != 0;
            int _286 = _270;
            int _288 = as_type<int>(_272);
            _146 = 1065353216;
            if (_280)
            {
                float _290 = -as_type<float>(_270);
                float _292 = _290 + 1.0;
                _286 = as_type<int>(_292);
            }
            int _294 = _286;
            if (_284)
            {
                float _296 = -_272;
                float _298 = _296 + 1.0;
                _288 = as_type<int>(_298);
            }
            int _300 = _288;
            bool _302 = !_276;
            float _304 = _302 ? as_type<float>(_294) : as_type<float>(_300);
            bool _306 = !_276;
            float _308 = _306 ? as_type<float>(_300) : as_type<float>(_294);
            _143 = _308;
            _148 = _304;
        }
    }
    _150 = false;
    float _310 = _143;
    int _312 = _146;
    float _314 = _148;
    float _316 = _310 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _318 = _310 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_312);
    bool _320 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _322 = fma(_314, (*spvDescriptorSet0.vp_c3)._m0[8].x, _316);
    float _324 = fma(_314, (*spvDescriptorSet0.vp_c3)._m0[7].x, _318);
    float _326 = _322 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _328 = _324 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _330 = -_326;
    float _332 = _330 + 1.0;
    out.m_27.x = _328;
    out.m_27.y = _332;
    bool _334 = !_320;
    float _360;
    int _362;
    float _364;
    if (!_334)
    {
        float _336 = _53 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _338 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _340 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _342 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[21].x, _336);
        float _344 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _338);
        float _346 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _340);
        float _348 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[21].z, _342);
        float _350 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _344);
        float _352 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _346);
        float _354 = _348 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        float _356 = _350 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _358 = _352 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _360 = _358;
        _362 = as_type<int>(_354);
        _364 = _356;
        _366 = true;
    }
    else
    {
        int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _370 = _368 != 0;
        float _372 = _47;
        float _374 = as_type<float>(_312);
        if (!_370)
        {
            float _376 = in.m_24.x;
            float _378 = in.m_24.y;
            _372 = _376;
            _374 = _378;
        }
        float _380 = _372;
        float _382 = _374;
        if (!_370)
        {
            _117 = 1.0;
        }
        float _384 = _117;
        bool _386 = !_370;
        _360 = _382;
        _362 = as_type<int>(_384);
        _364 = _380;
        if (!_386)
        {
            int _388 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _390 = _388 != 0;
            float _392 = _384;
            float _394 = _53;
            if (!_390)
            {
                float _396 = in.m_24.x;
                float _398 = in.m_24.y;
                _392 = _396;
                _394 = _398;
            }
            float _400 = _392;
            float _402 = _394;
            bool _404 = !_390;
            float _406 = _402;
            float _408 = _400;
            int _410 = as_type<int>(_400);
            float _412 = _402;
            if (!_404)
            {
                float _414 = in.m_24.x;
                float _416 = in.m_24.y;
                int _418 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _420 = _418 != 0;
                int _422 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _424 = _422 != 0;
                int _426 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _428 = _426 != 0;
                int _430 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _432 = _430 != 0;
                int _434 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _436 = _434 != 0;
                if (_420)
                {
                    _406 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _438 = _406;
                float _440 = _438;
                if (_420)
                {
                    _408 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _442 = _408;
                float _444 = _442;
                if (!_420)
                {
                    _440 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _446 = _440;
                if (!_420)
                {
                    _444 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _448 = _444;
                float _450 = _446 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _452 = _448 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _454 = _414;
                float _456 = _416;
                if (_432)
                {
                    float _458 = _450 * _414;
                    _454 = _458;
                }
                float _460 = _454;
                float _462 = -_450;
                float _464 = _462 + 1.0;
                int _466 = as_type<int>(_460);
                if (_436)
                {
                    float _468 = _452 * _416;
                    _456 = _468;
                }
                float _470 = _456;
                float _472 = -_452;
                float _474 = _472 + 1.0;
                float _476 = _470;
                if (_424)
                {
                    float _478 = _460 + _464;
                    _466 = as_type<int>(_478);
                }
                int _480 = _466;
                if (_428)
                {
                    float _482 = _470 + _474;
                    _476 = _482;
                }
                float _484 = _476;
                _410 = _480;
                _412 = _484;
            }
            int _486 = _410;
            float _488 = _412;
            int _490 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _492 = _490 != 0;
            int _494 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _496 = _494 != 0;
            int _498 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _500 = _498 != 0;
            int _502 = _486;
            int _504 = as_type<int>(_488);
            _362 = 1065353216;
            if (_496)
            {
                float _506 = -as_type<float>(_486);
                float _508 = _506 + 1.0;
                _502 = as_type<int>(_508);
            }
            int _510 = _502;
            if (_500)
            {
                float _512 = -_488;
                float _514 = _512 + 1.0;
                _504 = as_type<int>(_514);
            }
            int _516 = _504;
            bool _518 = !_492;
            float _520 = _518 ? as_type<float>(_510) : as_type<float>(_516);
            bool _522 = !_492;
            float _524 = _522 ? as_type<float>(_516) : as_type<float>(_510);
            _360 = _524;
            _364 = _520;
        }
    }
    _366 = false;
    float _526 = _360;
    int _528 = _362;
    float _530 = _364;
    float _532 = _526 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _534 = _526 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_528);
    float _536 = fma(_530, (*spvDescriptorSet0.vp_c3)._m0[10].x, _532);
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c3)._m0[9].x, _534);
    float _540 = _536 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _542 = _538 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _544 = -_540;
    float _546 = _544 + 1.0;
    out.m_29.x = _542;
    out.m_29.y = _546;
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _366 = false;
    bool _150 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = in.m_22.z;
    bool _51 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _53 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _55 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _61);
    float _69 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].z, _63);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].z, _65);
    float _73 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].z, _67);
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _81 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _83 = _75 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _85 = _75 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _75 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].x, _81);
    float _91 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].x, _83);
    float _93 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].z, _89);
    float _99 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].z, _91);
    float _101 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _107;
    out.gl_Position.y = _105;
    out.gl_Position.z = _109;
    out.gl_Position.w = _111;
    bool _113 = !_51;
    float _115 = _77;
    float _117 = _55;
    float _143;
    int _146;
    float _148;
    if (!_113)
    {
        float _119 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _121 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _123 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _125 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _119);
        float _127 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _121);
        float _129 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
        float _131 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[17].z, _125);
        float _133 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].z, _127);
        float _135 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].z, _129);
        float _137 = _131 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _139 = _133 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _141 = _135 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _143 = _141;
        _146 = as_type<int>(_137);
        _148 = _139;
        _150 = true;
    }
    else
    {
        int _152 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _154 = _152 != 0;
        float _156 = _107;
        float _158 = _105;
        if (!_154)
        {
            float _160 = in.m_24.x;
            float _162 = in.m_24.y;
            _156 = _160;
            _158 = _162;
        }
        float _164 = _156;
        float _166 = _158;
        if (!_154)
        {
            _115 = 1.0;
        }
        float _168 = _115;
        bool _170 = !_154;
        float _172 = _168;
        _143 = _166;
        _146 = as_type<int>(_168);
        _148 = _164;
        if (!_170)
        {
            int _174 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _176 = _174 != 0;
            float _178 = _164;
            float _180 = _166;
            if (!_176)
            {
                float _182 = in.m_24.x;
                float _184 = in.m_24.y;
                _178 = _182;
                _180 = _184;
            }
            float _186 = _178;
            float _188 = _180;
            bool _190 = !_176;
            float _192 = _186;
            int _194 = as_type<int>(_186);
            float _196 = _188;
            if (!_190)
            {
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _200 = _198 != 0;
                float _202 = in.m_24.x;
                float _204 = in.m_24.y;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _216 = _214 != 0;
                int _218 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _220 = _218 != 0;
                if (_200)
                {
                    _192 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _222 = _192;
                float _224 = _222;
                if (_200)
                {
                    _172 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _172;
                float _228 = _226;
                if (!_200)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _230 = _224;
                if (!_200)
                {
                    _228 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _232 = _228;
                float _234 = _230 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _236 = _232 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _238 = _202;
                float _240 = _204;
                if (_216)
                {
                    float _242 = _234 * _202;
                    _238 = _242;
                }
                float _244 = _238;
                float _246 = -_234;
                float _248 = _246 + 1.0;
                int _250 = as_type<int>(_244);
                if (_220)
                {
                    float _252 = _236 * _204;
                    _240 = _252;
                }
                float _254 = _240;
                float _256 = -_236;
                float _258 = _256 + 1.0;
                float _260 = _254;
                if (_208)
                {
                    float _262 = _244 + _248;
                    _250 = as_type<int>(_262);
                }
                int _264 = _250;
                if (_212)
                {
                    float _266 = _254 + _258;
                    _260 = _266;
                }
                float _268 = _260;
                _194 = _264;
                _196 = _268;
            }
            int _270 = _194;
            float _272 = _196;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _280 = _278 != 0;
            int _282 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _284 = _282 != 0;
            int _286 = _270;
            int _288 = as_type<int>(_272);
            _146 = 1065353216;
            if (_280)
            {
                float _290 = -as_type<float>(_270);
                float _292 = _290 + 1.0;
                _286 = as_type<int>(_292);
            }
            int _294 = _286;
            if (_284)
            {
                float _296 = -_272;
                float _298 = _296 + 1.0;
                _288 = as_type<int>(_298);
            }
            int _300 = _288;
            bool _302 = !_276;
            float _304 = _302 ? as_type<float>(_294) : as_type<float>(_300);
            bool _306 = !_276;
            float _308 = _306 ? as_type<float>(_300) : as_type<float>(_294);
            _143 = _308;
            _148 = _304;
        }
    }
    _150 = false;
    float _310 = _143;
    int _312 = _146;
    float _314 = _148;
    float _316 = _310 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _318 = _310 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_312);
    bool _320 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _322 = fma(_314, (*spvDescriptorSet0.vp_c3)._m0[8].x, _316);
    float _324 = fma(_314, (*spvDescriptorSet0.vp_c3)._m0[7].x, _318);
    float _326 = _322 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _328 = _324 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _330 = -_326;
    float _332 = _330 + 1.0;
    out.m_27.x = _328;
    out.m_27.y = _332;
    bool _334 = !_320;
    float _360;
    int _362;
    float _364;
    if (!_334)
    {
        float _336 = _53 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _338 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _340 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _342 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[21].x, _336);
        float _344 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _338);
        float _346 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _340);
        float _348 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[21].z, _342);
        float _350 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _344);
        float _352 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _346);
        float _354 = _348 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        float _356 = _350 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _358 = _352 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _360 = _358;
        _362 = as_type<int>(_354);
        _364 = _356;
        _366 = true;
    }
    else
    {
        int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _370 = _368 != 0;
        float _372 = _47;
        float _374 = as_type<float>(_312);
        if (!_370)
        {
            float _376 = in.m_24.x;
            float _378 = in.m_24.y;
            _372 = _376;
            _374 = _378;
        }
        float _380 = _372;
        float _382 = _374;
        if (!_370)
        {
            _117 = 1.0;
        }
        float _384 = _117;
        bool _386 = !_370;
        _360 = _382;
        _362 = as_type<int>(_384);
        _364 = _380;
        if (!_386)
        {
            int _388 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _390 = _388 != 0;
            float _392 = _384;
            float _394 = _53;
            if (!_390)
            {
                float _396 = in.m_24.x;
                float _398 = in.m_24.y;
                _392 = _396;
                _394 = _398;
            }
            float _400 = _392;
            float _402 = _394;
            bool _404 = !_390;
            float _406 = _402;
            float _408 = _400;
            int _410 = as_type<int>(_400);
            float _412 = _402;
            if (!_404)
            {
                float _414 = in.m_24.x;
                float _416 = in.m_24.y;
                int _418 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _420 = _418 != 0;
                int _422 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _424 = _422 != 0;
                int _426 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _428 = _426 != 0;
                int _430 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _432 = _430 != 0;
                int _434 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _436 = _434 != 0;
                if (_420)
                {
                    _406 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _438 = _406;
                float _440 = _438;
                if (_420)
                {
                    _408 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _442 = _408;
                float _444 = _442;
                if (!_420)
                {
                    _440 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _446 = _440;
                if (!_420)
                {
                    _444 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _448 = _444;
                float _450 = _446 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _452 = _448 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _454 = _414;
                float _456 = _416;
                if (_432)
                {
                    float _458 = _450 * _414;
                    _454 = _458;
                }
                float _460 = _454;
                float _462 = -_450;
                float _464 = _462 + 1.0;
                int _466 = as_type<int>(_460);
                if (_436)
                {
                    float _468 = _452 * _416;
                    _456 = _468;
                }
                float _470 = _456;
                float _472 = -_452;
                float _474 = _472 + 1.0;
                float _476 = _470;
                if (_424)
                {
                    float _478 = _460 + _464;
                    _466 = as_type<int>(_478);
                }
                int _480 = _466;
                if (_428)
                {
                    float _482 = _470 + _474;
                    _476 = _482;
                }
                float _484 = _476;
                _410 = _480;
                _412 = _484;
            }
            int _486 = _410;
            float _488 = _412;
            int _490 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _492 = _490 != 0;
            int _494 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _496 = _494 != 0;
            int _498 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _500 = _498 != 0;
            int _502 = _486;
            int _504 = as_type<int>(_488);
            _362 = 1065353216;
            if (_496)
            {
                float _506 = -as_type<float>(_486);
                float _508 = _506 + 1.0;
                _502 = as_type<int>(_508);
            }
            int _510 = _502;
            if (_500)
            {
                float _512 = -_488;
                float _514 = _512 + 1.0;
                _504 = as_type<int>(_514);
            }
            int _516 = _504;
            bool _518 = !_492;
            float _520 = _518 ? as_type<float>(_510) : as_type<float>(_516);
            bool _522 = !_492;
            float _524 = _522 ? as_type<float>(_516) : as_type<float>(_510);
            _360 = _524;
            _364 = _520;
        }
    }
    _366 = false;
    float _526 = _360;
    int _528 = _362;
    float _530 = _364;
    float _532 = _526 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _534 = _526 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_528);
    float _536 = fma(_530, (*spvDescriptorSet0.vp_c3)._m0[10].x, _532);
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c3)._m0[9].x, _534);
    float _540 = _536 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _542 = _538 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _544 = -_540;
    float _546 = _544 + 1.0;
    out.m_29.x = _542;
    out.m_29.y = _546;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


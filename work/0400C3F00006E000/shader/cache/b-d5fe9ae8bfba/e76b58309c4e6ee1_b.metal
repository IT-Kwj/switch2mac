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
    float4 m_25 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_27 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _348 = false;
    bool _147 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _57 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _59 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _61 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _63 = _57 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _65 = _57 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _67 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].x, _61);
    float _69 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[4].x, _63);
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[6].x, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _69);
    float _77 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _71);
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _85 = _79 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _87 = _79 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _89 = _79 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _91 = _79 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _93 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].x, _85);
    float _95 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].x, _87);
    float _97 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].z, _93);
    float _103 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].z, _95);
    float _105 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].z, _97);
    float _107 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].z, _99);
    float _109 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _113 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _115 = _103 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _117 = _101 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _119 = _105 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _121 = _107 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _109;
    out.m_25.y = _55;
    out.m_25.z = _111;
    out.m_25.w = _113;
    out.gl_Position.x = _115;
    out.gl_Position.y = _117;
    out.gl_Position.z = _119;
    out.gl_Position.w = _121;
    bool _123 = !_53;
    float _125 = _81;
    float _143;
    float _145;
    if (!_123)
    {
        float _127 = _57 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _129 = _57 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _131 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[14].x, _127);
        float _133 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[15].x, _129);
        float _135 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _131);
        float _137 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _133);
        float _139 = _135 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _141 = _137 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _143 = _141;
        _145 = _139;
        _147 = true;
    }
    else
    {
        int _150 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _152 = _150 != 0;
        float _154 = _115;
        float _156 = _117;
        if (!_152)
        {
            float _158 = in.m_27.x;
            float _160 = in.m_27.y;
            _154 = _158;
            _156 = _160;
        }
        float _162 = _154;
        float _164 = _156;
        bool _166 = !_152;
        _143 = _164;
        _145 = _162;
        if (!_166)
        {
            int _168 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _170 = _168 != 0;
            float _172 = _162;
            float _174 = _164;
            if (!_170)
            {
                float _176 = in.m_27.x;
                float _178 = in.m_27.y;
                _172 = _176;
                _174 = _178;
            }
            float _180 = _172;
            float _182 = _174;
            bool _184 = !_170;
            float _186 = _180;
            int _188 = as_type<int>(_180);
            float _190 = _182;
            if (!_184)
            {
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _194 = _192 != 0;
                float _196 = in.m_27.x;
                float _198 = in.m_27.y;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _206 = _204 != 0;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _210 = _208 != 0;
                int _212 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _214 = _212 != 0;
                if (_194)
                {
                    _186 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _216 = _186;
                float _218 = _216;
                if (_194)
                {
                    _125 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _220 = _125;
                float _222 = _220;
                if (!_194)
                {
                    _218 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _224 = _218;
                if (!_194)
                {
                    _222 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _226 = _222;
                float _228 = _224 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _232 = _196;
                float _234 = _198;
                if (_210)
                {
                    float _236 = _228 * _196;
                    _232 = _236;
                }
                float _238 = _232;
                float _240 = -_228;
                float _242 = _240 + 1.0;
                int _244 = as_type<int>(_238);
                if (_214)
                {
                    float _246 = _230 * _198;
                    _234 = _246;
                }
                float _248 = _234;
                float _250 = -_230;
                float _252 = _250 + 1.0;
                float _254 = _248;
                if (_202)
                {
                    float _256 = _238 + _242;
                    _244 = as_type<int>(_256);
                }
                int _258 = _244;
                if (_206)
                {
                    float _260 = _248 + _252;
                    _254 = _260;
                }
                float _262 = _254;
                _188 = _258;
                _190 = _262;
            }
            int _264 = _188;
            float _266 = _190;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _270 = _268 != 0;
            int _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _274 = _272 != 0;
            int _276 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _278 = _276 != 0;
            int _280 = _264;
            int _282 = as_type<int>(_266);
            if (_274)
            {
                float _284 = -as_type<float>(_264);
                float _286 = _284 + 1.0;
                _280 = as_type<int>(_286);
            }
            int _288 = _280;
            if (_278)
            {
                float _290 = -_266;
                float _292 = _290 + 1.0;
                _282 = as_type<int>(_292);
            }
            int _294 = _282;
            bool _296 = !_270;
            float _298 = _296 ? as_type<float>(_288) : as_type<float>(_294);
            bool _300 = !_270;
            float _302 = _300 ? as_type<float>(_294) : as_type<float>(_288);
            _143 = _302;
            _145 = _298;
        }
    }
    _147 = false;
    float _304 = _143;
    float _306 = _145;
    float _308 = _304 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _310 = _304 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _312 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _314 = fma(_306, (*spvDescriptorSet0.vp_c3)._m0[8].x, _308);
    float _316 = fma(_306, (*spvDescriptorSet0.vp_c3)._m0[7].x, _310);
    float _318 = _314 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _322 = -_318;
    float _324 = _322 + 1.0;
    out.m_29.x = _320;
    out.m_29.y = _324;
    bool _326 = !_312;
    float _344;
    float _346;
    if (!_326)
    {
        float _328 = _57 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _330 = _57 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _332 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[18].x, _328);
        float _334 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[19].x, _330);
        float _336 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _332);
        float _338 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _334);
        float _340 = _336 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _342 = _338 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _344 = _342;
        _346 = _340;
        _348 = true;
    }
    else
    {
        int _350 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _352 = _350 != 0;
        float _354 = _59;
        float _356 = _57;
        if (!_352)
        {
            float _358 = in.m_27.x;
            float _360 = in.m_27.y;
            _354 = _358;
            _356 = _360;
        }
        float _362 = _354;
        float _364 = _356;
        bool _366 = !_352;
        _344 = _364;
        _346 = _362;
        if (!_366)
        {
            int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _370 = _368 != 0;
            float _372 = _362;
            float _374 = _364;
            if (!_370)
            {
                float _376 = in.m_27.x;
                float _378 = in.m_27.y;
                _372 = _376;
                _374 = _378;
            }
            float _380 = _372;
            float _382 = _374;
            bool _384 = !_370;
            float _386 = _382;
            float _388 = _380;
            int _390 = as_type<int>(_380);
            float _392 = _382;
            if (!_384)
            {
                float _394 = in.m_27.x;
                float _396 = in.m_27.y;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _408 = _406 != 0;
                int _410 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _412 = _410 != 0;
                int _414 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _416 = _414 != 0;
                if (_400)
                {
                    _386 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _418 = _386;
                float _420 = _418;
                if (_400)
                {
                    _388 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _422 = _388;
                float _424 = _422;
                if (!_400)
                {
                    _420 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _426 = _420;
                if (!_400)
                {
                    _424 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _428 = _424;
                float _430 = _426 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _432 = _428 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _434 = _394;
                float _436 = _396;
                if (_412)
                {
                    float _438 = _430 * _394;
                    _434 = _438;
                }
                float _440 = _434;
                float _442 = -_430;
                float _444 = _442 + 1.0;
                int _446 = as_type<int>(_440);
                if (_416)
                {
                    float _448 = _432 * _396;
                    _436 = _448;
                }
                float _450 = _436;
                float _452 = -_432;
                float _454 = _452 + 1.0;
                float _456 = _450;
                if (_404)
                {
                    float _458 = _440 + _444;
                    _446 = as_type<int>(_458);
                }
                int _460 = _446;
                if (_408)
                {
                    float _462 = _450 + _454;
                    _456 = _462;
                }
                float _464 = _456;
                _390 = _460;
                _392 = _464;
            }
            int _466 = _390;
            float _468 = _392;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _472 = _470 != 0;
            int _474 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _476 = _474 != 0;
            int _478 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _480 = _478 != 0;
            int _482 = _466;
            int _484 = as_type<int>(_468);
            if (_476)
            {
                float _486 = -as_type<float>(_466);
                float _488 = _486 + 1.0;
                _482 = as_type<int>(_488);
            }
            int _490 = _482;
            if (_480)
            {
                float _492 = -_468;
                float _494 = _492 + 1.0;
                _484 = as_type<int>(_494);
            }
            int _496 = _484;
            bool _498 = !_472;
            float _500 = _498 ? as_type<float>(_490) : as_type<float>(_496);
            bool _502 = !_472;
            float _504 = _502 ? as_type<float>(_496) : as_type<float>(_490);
            _344 = _504;
            _346 = _500;
        }
    }
    _348 = false;
    float _506 = _344;
    float _508 = _346;
    float _510 = _506 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _512 = fma(_508, (*spvDescriptorSet0.vp_c3)._m0[9].x, _510);
    float _514 = _512 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_31.x = _514;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _348 = false;
    bool _147 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _57 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _59 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _61 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _63 = _57 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _65 = _57 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _67 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].x, _61);
    float _69 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[4].x, _63);
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[6].x, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _69);
    float _77 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _71);
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _85 = _79 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _87 = _79 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _89 = _79 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _91 = _79 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _93 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].x, _85);
    float _95 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].x, _87);
    float _97 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].z, _93);
    float _103 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].z, _95);
    float _105 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].z, _97);
    float _107 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].z, _99);
    float _109 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _113 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _115 = _103 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _117 = _101 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _119 = _105 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _121 = _107 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _109;
    out.m_25.y = _55;
    out.m_25.z = _111;
    out.m_25.w = _113;
    out.gl_Position.x = _115;
    out.gl_Position.y = _117;
    out.gl_Position.z = _119;
    out.gl_Position.w = _121;
    bool _123 = !_53;
    float _125 = _81;
    float _143;
    float _145;
    if (!_123)
    {
        float _127 = _57 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _129 = _57 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _131 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[14].x, _127);
        float _133 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[15].x, _129);
        float _135 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _131);
        float _137 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _133);
        float _139 = _135 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _141 = _137 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _143 = _141;
        _145 = _139;
        _147 = true;
    }
    else
    {
        int _150 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _152 = _150 != 0;
        float _154 = _115;
        float _156 = _117;
        if (!_152)
        {
            float _158 = in.m_27.x;
            float _160 = in.m_27.y;
            _154 = _158;
            _156 = _160;
        }
        float _162 = _154;
        float _164 = _156;
        bool _166 = !_152;
        _143 = _164;
        _145 = _162;
        if (!_166)
        {
            int _168 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _170 = _168 != 0;
            float _172 = _162;
            float _174 = _164;
            if (!_170)
            {
                float _176 = in.m_27.x;
                float _178 = in.m_27.y;
                _172 = _176;
                _174 = _178;
            }
            float _180 = _172;
            float _182 = _174;
            bool _184 = !_170;
            float _186 = _180;
            int _188 = as_type<int>(_180);
            float _190 = _182;
            if (!_184)
            {
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _194 = _192 != 0;
                float _196 = in.m_27.x;
                float _198 = in.m_27.y;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _206 = _204 != 0;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _210 = _208 != 0;
                int _212 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _214 = _212 != 0;
                if (_194)
                {
                    _186 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _216 = _186;
                float _218 = _216;
                if (_194)
                {
                    _125 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _220 = _125;
                float _222 = _220;
                if (!_194)
                {
                    _218 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _224 = _218;
                if (!_194)
                {
                    _222 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _226 = _222;
                float _228 = _224 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _232 = _196;
                float _234 = _198;
                if (_210)
                {
                    float _236 = _228 * _196;
                    _232 = _236;
                }
                float _238 = _232;
                float _240 = -_228;
                float _242 = _240 + 1.0;
                int _244 = as_type<int>(_238);
                if (_214)
                {
                    float _246 = _230 * _198;
                    _234 = _246;
                }
                float _248 = _234;
                float _250 = -_230;
                float _252 = _250 + 1.0;
                float _254 = _248;
                if (_202)
                {
                    float _256 = _238 + _242;
                    _244 = as_type<int>(_256);
                }
                int _258 = _244;
                if (_206)
                {
                    float _260 = _248 + _252;
                    _254 = _260;
                }
                float _262 = _254;
                _188 = _258;
                _190 = _262;
            }
            int _264 = _188;
            float _266 = _190;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _270 = _268 != 0;
            int _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _274 = _272 != 0;
            int _276 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _278 = _276 != 0;
            int _280 = _264;
            int _282 = as_type<int>(_266);
            if (_274)
            {
                float _284 = -as_type<float>(_264);
                float _286 = _284 + 1.0;
                _280 = as_type<int>(_286);
            }
            int _288 = _280;
            if (_278)
            {
                float _290 = -_266;
                float _292 = _290 + 1.0;
                _282 = as_type<int>(_292);
            }
            int _294 = _282;
            bool _296 = !_270;
            float _298 = _296 ? as_type<float>(_288) : as_type<float>(_294);
            bool _300 = !_270;
            float _302 = _300 ? as_type<float>(_294) : as_type<float>(_288);
            _143 = _302;
            _145 = _298;
        }
    }
    _147 = false;
    float _304 = _143;
    float _306 = _145;
    float _308 = _304 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _310 = _304 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _312 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _314 = fma(_306, (*spvDescriptorSet0.vp_c3)._m0[8].x, _308);
    float _316 = fma(_306, (*spvDescriptorSet0.vp_c3)._m0[7].x, _310);
    float _318 = _314 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _322 = -_318;
    float _324 = _322 + 1.0;
    out.m_29.x = _320;
    out.m_29.y = _324;
    bool _326 = !_312;
    float _344;
    float _346;
    if (!_326)
    {
        float _328 = _57 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _330 = _57 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _332 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[18].x, _328);
        float _334 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[19].x, _330);
        float _336 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _332);
        float _338 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _334);
        float _340 = _336 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _342 = _338 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _344 = _342;
        _346 = _340;
        _348 = true;
    }
    else
    {
        int _350 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _352 = _350 != 0;
        float _354 = _59;
        float _356 = _57;
        if (!_352)
        {
            float _358 = in.m_27.x;
            float _360 = in.m_27.y;
            _354 = _358;
            _356 = _360;
        }
        float _362 = _354;
        float _364 = _356;
        bool _366 = !_352;
        _344 = _364;
        _346 = _362;
        if (!_366)
        {
            int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _370 = _368 != 0;
            float _372 = _362;
            float _374 = _364;
            if (!_370)
            {
                float _376 = in.m_27.x;
                float _378 = in.m_27.y;
                _372 = _376;
                _374 = _378;
            }
            float _380 = _372;
            float _382 = _374;
            bool _384 = !_370;
            float _386 = _382;
            float _388 = _380;
            int _390 = as_type<int>(_380);
            float _392 = _382;
            if (!_384)
            {
                float _394 = in.m_27.x;
                float _396 = in.m_27.y;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _408 = _406 != 0;
                int _410 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _412 = _410 != 0;
                int _414 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _416 = _414 != 0;
                if (_400)
                {
                    _386 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _418 = _386;
                float _420 = _418;
                if (_400)
                {
                    _388 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _422 = _388;
                float _424 = _422;
                if (!_400)
                {
                    _420 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _426 = _420;
                if (!_400)
                {
                    _424 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _428 = _424;
                float _430 = _426 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _432 = _428 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _434 = _394;
                float _436 = _396;
                if (_412)
                {
                    float _438 = _430 * _394;
                    _434 = _438;
                }
                float _440 = _434;
                float _442 = -_430;
                float _444 = _442 + 1.0;
                int _446 = as_type<int>(_440);
                if (_416)
                {
                    float _448 = _432 * _396;
                    _436 = _448;
                }
                float _450 = _436;
                float _452 = -_432;
                float _454 = _452 + 1.0;
                float _456 = _450;
                if (_404)
                {
                    float _458 = _440 + _444;
                    _446 = as_type<int>(_458);
                }
                int _460 = _446;
                if (_408)
                {
                    float _462 = _450 + _454;
                    _456 = _462;
                }
                float _464 = _456;
                _390 = _460;
                _392 = _464;
            }
            int _466 = _390;
            float _468 = _392;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _472 = _470 != 0;
            int _474 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _476 = _474 != 0;
            int _478 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _480 = _478 != 0;
            int _482 = _466;
            int _484 = as_type<int>(_468);
            if (_476)
            {
                float _486 = -as_type<float>(_466);
                float _488 = _486 + 1.0;
                _482 = as_type<int>(_488);
            }
            int _490 = _482;
            if (_480)
            {
                float _492 = -_468;
                float _494 = _492 + 1.0;
                _484 = as_type<int>(_494);
            }
            int _496 = _484;
            bool _498 = !_472;
            float _500 = _498 ? as_type<float>(_490) : as_type<float>(_496);
            bool _502 = !_472;
            float _504 = _502 ? as_type<float>(_496) : as_type<float>(_490);
            _344 = _504;
            _346 = _500;
        }
    }
    _348 = false;
    float _506 = _344;
    float _508 = _346;
    float _510 = _506 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _512 = fma(_508, (*spvDescriptorSet0.vp_c3)._m0[9].x, _510);
    float _514 = _512 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_31.x = _514;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _348 = false;
    bool _147 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _57 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _59 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _61 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _63 = _57 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _65 = _57 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _67 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].x, _61);
    float _69 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[4].x, _63);
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[6].x, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _69);
    float _77 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _71);
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _85 = _79 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _87 = _79 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _89 = _79 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _91 = _79 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _93 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].x, _85);
    float _95 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].x, _87);
    float _97 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].z, _93);
    float _103 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].z, _95);
    float _105 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].z, _97);
    float _107 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].z, _99);
    float _109 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _113 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _115 = _103 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _117 = _101 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _119 = _105 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _121 = _107 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _109;
    out.m_25.y = _55;
    out.m_25.z = _111;
    out.m_25.w = _113;
    out.gl_Position.x = _115;
    out.gl_Position.y = _117;
    out.gl_Position.z = _119;
    out.gl_Position.w = _121;
    bool _123 = !_53;
    float _125 = _81;
    float _143;
    float _145;
    if (!_123)
    {
        float _127 = _57 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _129 = _57 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _131 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[14].x, _127);
        float _133 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[15].x, _129);
        float _135 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _131);
        float _137 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _133);
        float _139 = _135 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _141 = _137 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _143 = _141;
        _145 = _139;
        _147 = true;
    }
    else
    {
        int _150 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _152 = _150 != 0;
        float _154 = _115;
        float _156 = _117;
        if (!_152)
        {
            float _158 = in.m_27.x;
            float _160 = in.m_27.y;
            _154 = _158;
            _156 = _160;
        }
        float _162 = _154;
        float _164 = _156;
        bool _166 = !_152;
        _143 = _164;
        _145 = _162;
        if (!_166)
        {
            int _168 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _170 = _168 != 0;
            float _172 = _162;
            float _174 = _164;
            if (!_170)
            {
                float _176 = in.m_27.x;
                float _178 = in.m_27.y;
                _172 = _176;
                _174 = _178;
            }
            float _180 = _172;
            float _182 = _174;
            bool _184 = !_170;
            float _186 = _180;
            int _188 = as_type<int>(_180);
            float _190 = _182;
            if (!_184)
            {
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _194 = _192 != 0;
                float _196 = in.m_27.x;
                float _198 = in.m_27.y;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _206 = _204 != 0;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _210 = _208 != 0;
                int _212 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _214 = _212 != 0;
                if (_194)
                {
                    _186 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _216 = _186;
                float _218 = _216;
                if (_194)
                {
                    _125 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _220 = _125;
                float _222 = _220;
                if (!_194)
                {
                    _218 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _224 = _218;
                if (!_194)
                {
                    _222 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _226 = _222;
                float _228 = _224 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _232 = _196;
                float _234 = _198;
                if (_210)
                {
                    float _236 = _228 * _196;
                    _232 = _236;
                }
                float _238 = _232;
                float _240 = -_228;
                float _242 = _240 + 1.0;
                int _244 = as_type<int>(_238);
                if (_214)
                {
                    float _246 = _230 * _198;
                    _234 = _246;
                }
                float _248 = _234;
                float _250 = -_230;
                float _252 = _250 + 1.0;
                float _254 = _248;
                if (_202)
                {
                    float _256 = _238 + _242;
                    _244 = as_type<int>(_256);
                }
                int _258 = _244;
                if (_206)
                {
                    float _260 = _248 + _252;
                    _254 = _260;
                }
                float _262 = _254;
                _188 = _258;
                _190 = _262;
            }
            int _264 = _188;
            float _266 = _190;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _270 = _268 != 0;
            int _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _274 = _272 != 0;
            int _276 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _278 = _276 != 0;
            int _280 = _264;
            int _282 = as_type<int>(_266);
            if (_274)
            {
                float _284 = -as_type<float>(_264);
                float _286 = _284 + 1.0;
                _280 = as_type<int>(_286);
            }
            int _288 = _280;
            if (_278)
            {
                float _290 = -_266;
                float _292 = _290 + 1.0;
                _282 = as_type<int>(_292);
            }
            int _294 = _282;
            bool _296 = !_270;
            float _298 = _296 ? as_type<float>(_288) : as_type<float>(_294);
            bool _300 = !_270;
            float _302 = _300 ? as_type<float>(_294) : as_type<float>(_288);
            _143 = _302;
            _145 = _298;
        }
    }
    _147 = false;
    float _304 = _143;
    float _306 = _145;
    float _308 = _304 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _310 = _304 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _312 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _314 = fma(_306, (*spvDescriptorSet0.vp_c3)._m0[8].x, _308);
    float _316 = fma(_306, (*spvDescriptorSet0.vp_c3)._m0[7].x, _310);
    float _318 = _314 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _322 = -_318;
    float _324 = _322 + 1.0;
    out.m_29.x = _320;
    out.m_29.y = _324;
    bool _326 = !_312;
    float _344;
    float _346;
    if (!_326)
    {
        float _328 = _57 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _330 = _57 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _332 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[18].x, _328);
        float _334 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[19].x, _330);
        float _336 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _332);
        float _338 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _334);
        float _340 = _336 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _342 = _338 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _344 = _342;
        _346 = _340;
        _348 = true;
    }
    else
    {
        int _350 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _352 = _350 != 0;
        float _354 = _59;
        float _356 = _57;
        if (!_352)
        {
            float _358 = in.m_27.x;
            float _360 = in.m_27.y;
            _354 = _358;
            _356 = _360;
        }
        float _362 = _354;
        float _364 = _356;
        bool _366 = !_352;
        _344 = _364;
        _346 = _362;
        if (!_366)
        {
            int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _370 = _368 != 0;
            float _372 = _362;
            float _374 = _364;
            if (!_370)
            {
                float _376 = in.m_27.x;
                float _378 = in.m_27.y;
                _372 = _376;
                _374 = _378;
            }
            float _380 = _372;
            float _382 = _374;
            bool _384 = !_370;
            float _386 = _382;
            float _388 = _380;
            int _390 = as_type<int>(_380);
            float _392 = _382;
            if (!_384)
            {
                float _394 = in.m_27.x;
                float _396 = in.m_27.y;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _408 = _406 != 0;
                int _410 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _412 = _410 != 0;
                int _414 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _416 = _414 != 0;
                if (_400)
                {
                    _386 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _418 = _386;
                float _420 = _418;
                if (_400)
                {
                    _388 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _422 = _388;
                float _424 = _422;
                if (!_400)
                {
                    _420 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _426 = _420;
                if (!_400)
                {
                    _424 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _428 = _424;
                float _430 = _426 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _432 = _428 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _434 = _394;
                float _436 = _396;
                if (_412)
                {
                    float _438 = _430 * _394;
                    _434 = _438;
                }
                float _440 = _434;
                float _442 = -_430;
                float _444 = _442 + 1.0;
                int _446 = as_type<int>(_440);
                if (_416)
                {
                    float _448 = _432 * _396;
                    _436 = _448;
                }
                float _450 = _436;
                float _452 = -_432;
                float _454 = _452 + 1.0;
                float _456 = _450;
                if (_404)
                {
                    float _458 = _440 + _444;
                    _446 = as_type<int>(_458);
                }
                int _460 = _446;
                if (_408)
                {
                    float _462 = _450 + _454;
                    _456 = _462;
                }
                float _464 = _456;
                _390 = _460;
                _392 = _464;
            }
            int _466 = _390;
            float _468 = _392;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _472 = _470 != 0;
            int _474 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _476 = _474 != 0;
            int _478 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _480 = _478 != 0;
            int _482 = _466;
            int _484 = as_type<int>(_468);
            if (_476)
            {
                float _486 = -as_type<float>(_466);
                float _488 = _486 + 1.0;
                _482 = as_type<int>(_488);
            }
            int _490 = _482;
            if (_480)
            {
                float _492 = -_468;
                float _494 = _492 + 1.0;
                _484 = as_type<int>(_494);
            }
            int _496 = _484;
            bool _498 = !_472;
            float _500 = _498 ? as_type<float>(_490) : as_type<float>(_496);
            bool _502 = !_472;
            float _504 = _502 ? as_type<float>(_496) : as_type<float>(_490);
            _344 = _504;
            _346 = _500;
        }
    }
    _348 = false;
    float _506 = _344;
    float _508 = _346;
    float _510 = _506 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _512 = fma(_508, (*spvDescriptorSet0.vp_c3)._m0[9].x, _510);
    float _514 = _512 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_31.x = _514;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


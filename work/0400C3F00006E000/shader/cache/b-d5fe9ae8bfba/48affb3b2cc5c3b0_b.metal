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
    bool _342 = false;
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[13].w * 255.0;
    float _111 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _113 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _115 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.w = _109;
    out.gl_Position.x = _111;
    out.gl_Position.y = _107;
    out.gl_Position.z = _113;
    out.gl_Position.w = _115;
    bool _117 = !_53;
    float _119 = _109;
    float _137;
    float _139;
    if (!_117)
    {
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _125 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _121);
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
        float _129 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _125);
        float _131 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _127);
        float _133 = _129 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _137 = _135;
        _139 = _133;
        _141 = true;
    }
    else
    {
        int _144 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _146 = _144 != 0;
        float _148 = _111;
        float _150 = _107;
        if (!_146)
        {
            float _152 = in.m_27.x;
            float _154 = in.m_27.y;
            _148 = _152;
            _150 = _154;
        }
        float _156 = _148;
        float _158 = _150;
        bool _160 = !_146;
        _137 = _158;
        _139 = _156;
        if (!_160)
        {
            int _162 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _164 = _162 != 0;
            float _166 = _156;
            float _168 = _158;
            if (!_164)
            {
                float _170 = in.m_27.x;
                float _172 = in.m_27.y;
                _166 = _170;
                _168 = _172;
            }
            float _174 = _166;
            float _176 = _168;
            bool _178 = !_164;
            float _180 = _174;
            int _182 = as_type<int>(_174);
            float _184 = _176;
            if (!_178)
            {
                int _186 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _188 = _186 != 0;
                float _190 = in.m_27.x;
                float _192 = in.m_27.y;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _208 = _206 != 0;
                if (_188)
                {
                    _180 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _210 = _180;
                float _212 = _210;
                if (_188)
                {
                    _119 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _214 = _119;
                float _216 = _214;
                if (!_188)
                {
                    _212 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _218 = _212;
                if (!_188)
                {
                    _216 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _220 = _216;
                float _222 = _218 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _224 = _220 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _226 = _190;
                float _228 = _192;
                if (_204)
                {
                    float _230 = _222 * _190;
                    _226 = _230;
                }
                float _232 = _226;
                float _234 = -_222;
                float _236 = _234 + 1.0;
                int _238 = as_type<int>(_232);
                if (_208)
                {
                    float _240 = _224 * _192;
                    _228 = _240;
                }
                float _242 = _228;
                float _244 = -_224;
                float _246 = _244 + 1.0;
                float _248 = _242;
                if (_196)
                {
                    float _250 = _232 + _236;
                    _238 = as_type<int>(_250);
                }
                int _252 = _238;
                if (_200)
                {
                    float _254 = _242 + _246;
                    _248 = _254;
                }
                float _256 = _248;
                _182 = _252;
                _184 = _256;
            }
            int _258 = _182;
            float _260 = _184;
            int _262 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _264 = _262 != 0;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _268 = _266 != 0;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _272 = _270 != 0;
            int _274 = _258;
            int _276 = as_type<int>(_260);
            if (_268)
            {
                float _278 = -as_type<float>(_258);
                float _280 = _278 + 1.0;
                _274 = as_type<int>(_280);
            }
            int _282 = _274;
            if (_272)
            {
                float _284 = -_260;
                float _286 = _284 + 1.0;
                _276 = as_type<int>(_286);
            }
            int _288 = _276;
            bool _290 = !_264;
            float _292 = _290 ? as_type<float>(_282) : as_type<float>(_288);
            bool _294 = !_264;
            float _296 = _294 ? as_type<float>(_288) : as_type<float>(_282);
            _137 = _296;
            _139 = _292;
        }
    }
    _141 = false;
    float _298 = _137;
    float _300 = _139;
    float _302 = _298 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _304 = _298 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _306 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _308 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[8].x, _302);
    float _310 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[7].x, _304);
    float _312 = _308 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _316 = -_312;
    float _318 = _316 + 1.0;
    out.m_29.x = _314;
    out.m_29.y = _318;
    bool _320 = !_306;
    float _338;
    float _340;
    if (!_320)
    {
        float _322 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _324 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _326 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _322);
        float _328 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _324);
        float _330 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _326);
        float _332 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _328);
        float _334 = _330 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _336 = _332 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _338 = _336;
        _340 = _334;
        _342 = true;
    }
    else
    {
        int _344 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _346 = _344 != 0;
        float _348 = _57;
        float _350 = _55;
        if (!_346)
        {
            float _352 = in.m_27.x;
            float _354 = in.m_27.y;
            _348 = _352;
            _350 = _354;
        }
        float _356 = _348;
        float _358 = _350;
        bool _360 = !_346;
        _338 = _358;
        _340 = _356;
        if (!_360)
        {
            int _362 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _364 = _362 != 0;
            float _366 = _356;
            float _368 = _358;
            if (!_364)
            {
                float _370 = in.m_27.x;
                float _372 = in.m_27.y;
                _366 = _370;
                _368 = _372;
            }
            float _374 = _366;
            float _376 = _368;
            bool _378 = !_364;
            float _380 = _376;
            float _382 = _374;
            int _384 = as_type<int>(_374);
            float _386 = _376;
            if (!_378)
            {
                float _388 = in.m_27.x;
                float _390 = in.m_27.y;
                int _392 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _394 = _392 != 0;
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _398 = _396 != 0;
                int _400 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _402 = _400 != 0;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _406 = _404 != 0;
                int _408 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _410 = _408 != 0;
                if (_394)
                {
                    _380 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _412 = _380;
                float _414 = _412;
                if (_394)
                {
                    _382 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _416 = _382;
                float _418 = _416;
                if (!_394)
                {
                    _414 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _420 = _414;
                if (!_394)
                {
                    _418 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _422 = _418;
                float _424 = _420 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _426 = _422 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _428 = _388;
                float _430 = _390;
                if (_406)
                {
                    float _432 = _424 * _388;
                    _428 = _432;
                }
                float _434 = _428;
                float _436 = -_424;
                float _438 = _436 + 1.0;
                int _440 = as_type<int>(_434);
                if (_410)
                {
                    float _442 = _426 * _390;
                    _430 = _442;
                }
                float _444 = _430;
                float _446 = -_426;
                float _448 = _446 + 1.0;
                float _450 = _444;
                if (_398)
                {
                    float _452 = _434 + _438;
                    _440 = as_type<int>(_452);
                }
                int _454 = _440;
                if (_402)
                {
                    float _456 = _444 + _448;
                    _450 = _456;
                }
                float _458 = _450;
                _384 = _454;
                _386 = _458;
            }
            int _460 = _384;
            float _462 = _386;
            int _464 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _466 = _464 != 0;
            int _468 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _470 = _468 != 0;
            int _472 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _474 = _472 != 0;
            int _476 = _460;
            int _478 = as_type<int>(_462);
            if (_470)
            {
                float _480 = -as_type<float>(_460);
                float _482 = _480 + 1.0;
                _476 = as_type<int>(_482);
            }
            int _484 = _476;
            if (_474)
            {
                float _486 = -_462;
                float _488 = _486 + 1.0;
                _478 = as_type<int>(_488);
            }
            int _490 = _478;
            bool _492 = !_466;
            float _494 = _492 ? as_type<float>(_484) : as_type<float>(_490);
            bool _496 = !_466;
            float _498 = _496 ? as_type<float>(_490) : as_type<float>(_484);
            _338 = _498;
            _340 = _494;
        }
    }
    _342 = false;
    float _500 = _338;
    float _502 = _340;
    float _504 = _500 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _506 = _500 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _508 = fma(_502, (*spvDescriptorSet0.vp_c3)._m0[10].x, _504);
    float _510 = fma(_502, (*spvDescriptorSet0.vp_c3)._m0[9].x, _506);
    float _512 = _508 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _514 = _510 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _516 = -_512;
    float _518 = _516 + 1.0;
    out.m_31.x = _514;
    out.m_31.y = _518;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _342 = false;
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[13].w * 255.0;
    float _111 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _113 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _115 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.w = _109;
    out.gl_Position.x = _111;
    out.gl_Position.y = _107;
    out.gl_Position.z = _113;
    out.gl_Position.w = _115;
    bool _117 = !_53;
    float _119 = _109;
    float _137;
    float _139;
    if (!_117)
    {
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _125 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _121);
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
        float _129 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _125);
        float _131 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _127);
        float _133 = _129 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _137 = _135;
        _139 = _133;
        _141 = true;
    }
    else
    {
        int _144 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _146 = _144 != 0;
        float _148 = _111;
        float _150 = _107;
        if (!_146)
        {
            float _152 = in.m_27.x;
            float _154 = in.m_27.y;
            _148 = _152;
            _150 = _154;
        }
        float _156 = _148;
        float _158 = _150;
        bool _160 = !_146;
        _137 = _158;
        _139 = _156;
        if (!_160)
        {
            int _162 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _164 = _162 != 0;
            float _166 = _156;
            float _168 = _158;
            if (!_164)
            {
                float _170 = in.m_27.x;
                float _172 = in.m_27.y;
                _166 = _170;
                _168 = _172;
            }
            float _174 = _166;
            float _176 = _168;
            bool _178 = !_164;
            float _180 = _174;
            int _182 = as_type<int>(_174);
            float _184 = _176;
            if (!_178)
            {
                int _186 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _188 = _186 != 0;
                float _190 = in.m_27.x;
                float _192 = in.m_27.y;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _208 = _206 != 0;
                if (_188)
                {
                    _180 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _210 = _180;
                float _212 = _210;
                if (_188)
                {
                    _119 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _214 = _119;
                float _216 = _214;
                if (!_188)
                {
                    _212 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _218 = _212;
                if (!_188)
                {
                    _216 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _220 = _216;
                float _222 = _218 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _224 = _220 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _226 = _190;
                float _228 = _192;
                if (_204)
                {
                    float _230 = _222 * _190;
                    _226 = _230;
                }
                float _232 = _226;
                float _234 = -_222;
                float _236 = _234 + 1.0;
                int _238 = as_type<int>(_232);
                if (_208)
                {
                    float _240 = _224 * _192;
                    _228 = _240;
                }
                float _242 = _228;
                float _244 = -_224;
                float _246 = _244 + 1.0;
                float _248 = _242;
                if (_196)
                {
                    float _250 = _232 + _236;
                    _238 = as_type<int>(_250);
                }
                int _252 = _238;
                if (_200)
                {
                    float _254 = _242 + _246;
                    _248 = _254;
                }
                float _256 = _248;
                _182 = _252;
                _184 = _256;
            }
            int _258 = _182;
            float _260 = _184;
            int _262 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _264 = _262 != 0;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _268 = _266 != 0;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _272 = _270 != 0;
            int _274 = _258;
            int _276 = as_type<int>(_260);
            if (_268)
            {
                float _278 = -as_type<float>(_258);
                float _280 = _278 + 1.0;
                _274 = as_type<int>(_280);
            }
            int _282 = _274;
            if (_272)
            {
                float _284 = -_260;
                float _286 = _284 + 1.0;
                _276 = as_type<int>(_286);
            }
            int _288 = _276;
            bool _290 = !_264;
            float _292 = _290 ? as_type<float>(_282) : as_type<float>(_288);
            bool _294 = !_264;
            float _296 = _294 ? as_type<float>(_288) : as_type<float>(_282);
            _137 = _296;
            _139 = _292;
        }
    }
    _141 = false;
    float _298 = _137;
    float _300 = _139;
    float _302 = _298 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _304 = _298 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _306 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _308 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[8].x, _302);
    float _310 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[7].x, _304);
    float _312 = _308 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _316 = -_312;
    float _318 = _316 + 1.0;
    out.m_29.x = _314;
    out.m_29.y = _318;
    bool _320 = !_306;
    float _338;
    float _340;
    if (!_320)
    {
        float _322 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _324 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _326 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _322);
        float _328 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _324);
        float _330 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _326);
        float _332 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _328);
        float _334 = _330 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _336 = _332 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _338 = _336;
        _340 = _334;
        _342 = true;
    }
    else
    {
        int _344 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _346 = _344 != 0;
        float _348 = _57;
        float _350 = _55;
        if (!_346)
        {
            float _352 = in.m_27.x;
            float _354 = in.m_27.y;
            _348 = _352;
            _350 = _354;
        }
        float _356 = _348;
        float _358 = _350;
        bool _360 = !_346;
        _338 = _358;
        _340 = _356;
        if (!_360)
        {
            int _362 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _364 = _362 != 0;
            float _366 = _356;
            float _368 = _358;
            if (!_364)
            {
                float _370 = in.m_27.x;
                float _372 = in.m_27.y;
                _366 = _370;
                _368 = _372;
            }
            float _374 = _366;
            float _376 = _368;
            bool _378 = !_364;
            float _380 = _376;
            float _382 = _374;
            int _384 = as_type<int>(_374);
            float _386 = _376;
            if (!_378)
            {
                float _388 = in.m_27.x;
                float _390 = in.m_27.y;
                int _392 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _394 = _392 != 0;
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _398 = _396 != 0;
                int _400 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _402 = _400 != 0;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _406 = _404 != 0;
                int _408 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _410 = _408 != 0;
                if (_394)
                {
                    _380 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _412 = _380;
                float _414 = _412;
                if (_394)
                {
                    _382 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _416 = _382;
                float _418 = _416;
                if (!_394)
                {
                    _414 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _420 = _414;
                if (!_394)
                {
                    _418 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _422 = _418;
                float _424 = _420 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _426 = _422 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _428 = _388;
                float _430 = _390;
                if (_406)
                {
                    float _432 = _424 * _388;
                    _428 = _432;
                }
                float _434 = _428;
                float _436 = -_424;
                float _438 = _436 + 1.0;
                int _440 = as_type<int>(_434);
                if (_410)
                {
                    float _442 = _426 * _390;
                    _430 = _442;
                }
                float _444 = _430;
                float _446 = -_426;
                float _448 = _446 + 1.0;
                float _450 = _444;
                if (_398)
                {
                    float _452 = _434 + _438;
                    _440 = as_type<int>(_452);
                }
                int _454 = _440;
                if (_402)
                {
                    float _456 = _444 + _448;
                    _450 = _456;
                }
                float _458 = _450;
                _384 = _454;
                _386 = _458;
            }
            int _460 = _384;
            float _462 = _386;
            int _464 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _466 = _464 != 0;
            int _468 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _470 = _468 != 0;
            int _472 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _474 = _472 != 0;
            int _476 = _460;
            int _478 = as_type<int>(_462);
            if (_470)
            {
                float _480 = -as_type<float>(_460);
                float _482 = _480 + 1.0;
                _476 = as_type<int>(_482);
            }
            int _484 = _476;
            if (_474)
            {
                float _486 = -_462;
                float _488 = _486 + 1.0;
                _478 = as_type<int>(_488);
            }
            int _490 = _478;
            bool _492 = !_466;
            float _494 = _492 ? as_type<float>(_484) : as_type<float>(_490);
            bool _496 = !_466;
            float _498 = _496 ? as_type<float>(_490) : as_type<float>(_484);
            _338 = _498;
            _340 = _494;
        }
    }
    _342 = false;
    float _500 = _338;
    float _502 = _340;
    float _504 = _500 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _506 = _500 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _508 = fma(_502, (*spvDescriptorSet0.vp_c3)._m0[10].x, _504);
    float _510 = fma(_502, (*spvDescriptorSet0.vp_c3)._m0[9].x, _506);
    float _512 = _508 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _514 = _510 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _516 = -_512;
    float _518 = _516 + 1.0;
    out.m_31.x = _514;
    out.m_31.y = _518;
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
    bool _342 = false;
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[13].w * 255.0;
    float _111 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _113 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _115 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.w = _109;
    out.gl_Position.x = _111;
    out.gl_Position.y = _107;
    out.gl_Position.z = _113;
    out.gl_Position.w = _115;
    bool _117 = !_53;
    float _119 = _109;
    float _137;
    float _139;
    if (!_117)
    {
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _125 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _121);
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
        float _129 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _125);
        float _131 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _127);
        float _133 = _129 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _137 = _135;
        _139 = _133;
        _141 = true;
    }
    else
    {
        int _144 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _146 = _144 != 0;
        float _148 = _111;
        float _150 = _107;
        if (!_146)
        {
            float _152 = in.m_27.x;
            float _154 = in.m_27.y;
            _148 = _152;
            _150 = _154;
        }
        float _156 = _148;
        float _158 = _150;
        bool _160 = !_146;
        _137 = _158;
        _139 = _156;
        if (!_160)
        {
            int _162 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _164 = _162 != 0;
            float _166 = _156;
            float _168 = _158;
            if (!_164)
            {
                float _170 = in.m_27.x;
                float _172 = in.m_27.y;
                _166 = _170;
                _168 = _172;
            }
            float _174 = _166;
            float _176 = _168;
            bool _178 = !_164;
            float _180 = _174;
            int _182 = as_type<int>(_174);
            float _184 = _176;
            if (!_178)
            {
                int _186 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _188 = _186 != 0;
                float _190 = in.m_27.x;
                float _192 = in.m_27.y;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _208 = _206 != 0;
                if (_188)
                {
                    _180 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _210 = _180;
                float _212 = _210;
                if (_188)
                {
                    _119 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _214 = _119;
                float _216 = _214;
                if (!_188)
                {
                    _212 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _218 = _212;
                if (!_188)
                {
                    _216 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _220 = _216;
                float _222 = _218 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _224 = _220 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _226 = _190;
                float _228 = _192;
                if (_204)
                {
                    float _230 = _222 * _190;
                    _226 = _230;
                }
                float _232 = _226;
                float _234 = -_222;
                float _236 = _234 + 1.0;
                int _238 = as_type<int>(_232);
                if (_208)
                {
                    float _240 = _224 * _192;
                    _228 = _240;
                }
                float _242 = _228;
                float _244 = -_224;
                float _246 = _244 + 1.0;
                float _248 = _242;
                if (_196)
                {
                    float _250 = _232 + _236;
                    _238 = as_type<int>(_250);
                }
                int _252 = _238;
                if (_200)
                {
                    float _254 = _242 + _246;
                    _248 = _254;
                }
                float _256 = _248;
                _182 = _252;
                _184 = _256;
            }
            int _258 = _182;
            float _260 = _184;
            int _262 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _264 = _262 != 0;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _268 = _266 != 0;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _272 = _270 != 0;
            int _274 = _258;
            int _276 = as_type<int>(_260);
            if (_268)
            {
                float _278 = -as_type<float>(_258);
                float _280 = _278 + 1.0;
                _274 = as_type<int>(_280);
            }
            int _282 = _274;
            if (_272)
            {
                float _284 = -_260;
                float _286 = _284 + 1.0;
                _276 = as_type<int>(_286);
            }
            int _288 = _276;
            bool _290 = !_264;
            float _292 = _290 ? as_type<float>(_282) : as_type<float>(_288);
            bool _294 = !_264;
            float _296 = _294 ? as_type<float>(_288) : as_type<float>(_282);
            _137 = _296;
            _139 = _292;
        }
    }
    _141 = false;
    float _298 = _137;
    float _300 = _139;
    float _302 = _298 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _304 = _298 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _306 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _308 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[8].x, _302);
    float _310 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[7].x, _304);
    float _312 = _308 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _316 = -_312;
    float _318 = _316 + 1.0;
    out.m_29.x = _314;
    out.m_29.y = _318;
    bool _320 = !_306;
    float _338;
    float _340;
    if (!_320)
    {
        float _322 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _324 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _326 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _322);
        float _328 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _324);
        float _330 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _326);
        float _332 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _328);
        float _334 = _330 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _336 = _332 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _338 = _336;
        _340 = _334;
        _342 = true;
    }
    else
    {
        int _344 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _346 = _344 != 0;
        float _348 = _57;
        float _350 = _55;
        if (!_346)
        {
            float _352 = in.m_27.x;
            float _354 = in.m_27.y;
            _348 = _352;
            _350 = _354;
        }
        float _356 = _348;
        float _358 = _350;
        bool _360 = !_346;
        _338 = _358;
        _340 = _356;
        if (!_360)
        {
            int _362 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _364 = _362 != 0;
            float _366 = _356;
            float _368 = _358;
            if (!_364)
            {
                float _370 = in.m_27.x;
                float _372 = in.m_27.y;
                _366 = _370;
                _368 = _372;
            }
            float _374 = _366;
            float _376 = _368;
            bool _378 = !_364;
            float _380 = _376;
            float _382 = _374;
            int _384 = as_type<int>(_374);
            float _386 = _376;
            if (!_378)
            {
                float _388 = in.m_27.x;
                float _390 = in.m_27.y;
                int _392 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _394 = _392 != 0;
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _398 = _396 != 0;
                int _400 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _402 = _400 != 0;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _406 = _404 != 0;
                int _408 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _410 = _408 != 0;
                if (_394)
                {
                    _380 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _412 = _380;
                float _414 = _412;
                if (_394)
                {
                    _382 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _416 = _382;
                float _418 = _416;
                if (!_394)
                {
                    _414 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _420 = _414;
                if (!_394)
                {
                    _418 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _422 = _418;
                float _424 = _420 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _426 = _422 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _428 = _388;
                float _430 = _390;
                if (_406)
                {
                    float _432 = _424 * _388;
                    _428 = _432;
                }
                float _434 = _428;
                float _436 = -_424;
                float _438 = _436 + 1.0;
                int _440 = as_type<int>(_434);
                if (_410)
                {
                    float _442 = _426 * _390;
                    _430 = _442;
                }
                float _444 = _430;
                float _446 = -_426;
                float _448 = _446 + 1.0;
                float _450 = _444;
                if (_398)
                {
                    float _452 = _434 + _438;
                    _440 = as_type<int>(_452);
                }
                int _454 = _440;
                if (_402)
                {
                    float _456 = _444 + _448;
                    _450 = _456;
                }
                float _458 = _450;
                _384 = _454;
                _386 = _458;
            }
            int _460 = _384;
            float _462 = _386;
            int _464 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _466 = _464 != 0;
            int _468 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _470 = _468 != 0;
            int _472 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _474 = _472 != 0;
            int _476 = _460;
            int _478 = as_type<int>(_462);
            if (_470)
            {
                float _480 = -as_type<float>(_460);
                float _482 = _480 + 1.0;
                _476 = as_type<int>(_482);
            }
            int _484 = _476;
            if (_474)
            {
                float _486 = -_462;
                float _488 = _486 + 1.0;
                _478 = as_type<int>(_488);
            }
            int _490 = _478;
            bool _492 = !_466;
            float _494 = _492 ? as_type<float>(_484) : as_type<float>(_490);
            bool _496 = !_466;
            float _498 = _496 ? as_type<float>(_490) : as_type<float>(_484);
            _338 = _498;
            _340 = _494;
        }
    }
    _342 = false;
    float _500 = _338;
    float _502 = _340;
    float _504 = _500 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _506 = _500 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _508 = fma(_502, (*spvDescriptorSet0.vp_c3)._m0[10].x, _504);
    float _510 = fma(_502, (*spvDescriptorSet0.vp_c3)._m0[9].x, _506);
    float _512 = _508 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _514 = _510 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _516 = -_512;
    float _518 = _516 + 1.0;
    out.m_31.x = _514;
    out.m_31.y = _518;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


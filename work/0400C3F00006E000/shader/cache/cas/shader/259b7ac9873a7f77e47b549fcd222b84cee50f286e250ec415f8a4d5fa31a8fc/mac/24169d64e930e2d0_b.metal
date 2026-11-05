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
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_24 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _338 = false;
    bool _135 = false;
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
    float _81 = _75 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _75 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _75 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _107;
    out.gl_Position.z = _109;
    out.gl_Position.w = _111;
    bool _113 = !_51;
    float _131;
    float _133;
    if (!_113)
    {
        float _115 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _117 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _119 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _115);
        float _121 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _117);
        float _123 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].z, _119);
        float _125 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].z, _121);
        float _127 = _123 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _129 = _125 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _131 = _129;
        _133 = _127;
        _135 = true;
    }
    else
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _140 = _138 != 0;
        float _142 = _97;
        float _144 = _77;
        if (!_140)
        {
            float _146 = in.m_24.x;
            float _148 = in.m_24.y;
            _142 = _146;
            _144 = _148;
        }
        float _150 = _142;
        float _152 = _144;
        bool _154 = !_140;
        _131 = _152;
        _133 = _150;
        if (!_154)
        {
            int _156 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _158 = _156 != 0;
            float _160 = _150;
            float _162 = _152;
            if (!_158)
            {
                float _164 = in.m_24.x;
                float _166 = in.m_24.y;
                _160 = _164;
                _162 = _166;
            }
            float _168 = _160;
            float _170 = _162;
            bool _172 = !_158;
            float _174 = _170;
            float _176 = _168;
            int _178 = as_type<int>(_168);
            float _180 = _170;
            if (!_172)
            {
                float _182 = in.m_24.x;
                float _184 = in.m_24.y;
                int _186 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _188 = _186 != 0;
                int _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _192 = _190 != 0;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _204 = _202 != 0;
                if (_188)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _206 = _174;
                float _208 = _206;
                if (_188)
                {
                    _176 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _210 = _176;
                float _212 = _210;
                if (!_188)
                {
                    _208 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _214 = _208;
                if (!_188)
                {
                    _212 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _216 = _212;
                float _218 = _214 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _222 = _182;
                float _224 = _184;
                if (_200)
                {
                    float _226 = _218 * _182;
                    _222 = _226;
                }
                float _228 = _222;
                float _230 = -_218;
                float _232 = _230 + 1.0;
                int _234 = as_type<int>(_228);
                if (_204)
                {
                    float _236 = _220 * _184;
                    _224 = _236;
                }
                float _238 = _224;
                float _240 = -_220;
                float _242 = _240 + 1.0;
                float _244 = _238;
                if (_192)
                {
                    float _246 = _228 + _232;
                    _234 = as_type<int>(_246);
                }
                int _248 = _234;
                if (_196)
                {
                    float _250 = _238 + _242;
                    _244 = _250;
                }
                float _252 = _244;
                _178 = _248;
                _180 = _252;
            }
            int _254 = _178;
            float _256 = _180;
            int _258 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _260 = _258 != 0;
            int _262 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _264 = _262 != 0;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _268 = _266 != 0;
            int _270 = _254;
            int _272 = as_type<int>(_256);
            if (_264)
            {
                float _274 = -as_type<float>(_254);
                float _276 = _274 + 1.0;
                _270 = as_type<int>(_276);
            }
            int _278 = _270;
            if (_268)
            {
                float _280 = -_256;
                float _282 = _280 + 1.0;
                _272 = as_type<int>(_282);
            }
            int _284 = _272;
            bool _286 = !_260;
            float _288 = _286 ? as_type<float>(_278) : as_type<float>(_284);
            bool _290 = !_260;
            float _292 = _290 ? as_type<float>(_284) : as_type<float>(_278);
            _131 = _292;
            _133 = _288;
        }
    }
    _135 = false;
    float _294 = _131;
    float _296 = _133;
    float _298 = _294 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _300 = _294 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _302 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _304 = fma(_296, (*spvDescriptorSet0.vp_c3)._m0[8].x, _298);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c3)._m0[7].x, _300);
    float _308 = _304 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _310 = _306 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _312 = -_308;
    float _314 = _312 + 1.0;
    out.m_27.x = _310;
    out.m_27.y = _314;
    bool _316 = !_302;
    float _334;
    float _336;
    if (!_316)
    {
        float _318 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _320 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _322 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _318);
        float _324 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _320);
        float _326 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _322);
        float _328 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _324);
        float _330 = _326 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _332 = _328 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _334 = _332;
        _336 = _330;
        _338 = true;
    }
    else
    {
        int _340 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _342 = _340 != 0;
        float _344 = _310;
        float _346 = _314;
        if (!_342)
        {
            float _348 = in.m_24.x;
            float _350 = in.m_24.y;
            _344 = _348;
            _346 = _350;
        }
        float _352 = _344;
        float _354 = _346;
        bool _356 = !_342;
        _334 = _354;
        _336 = _352;
        if (!_356)
        {
            int _358 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _360 = _358 != 0;
            float _362 = _352;
            float _364 = _354;
            if (!_360)
            {
                float _366 = in.m_24.x;
                float _368 = in.m_24.y;
                _362 = _366;
                _364 = _368;
            }
            float _370 = _362;
            float _372 = _364;
            bool _374 = !_360;
            float _376 = _372;
            float _378 = _370;
            int _380 = as_type<int>(_370);
            float _382 = _372;
            if (!_374)
            {
                float _384 = in.m_24.x;
                float _386 = in.m_24.y;
                int _388 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _390 = _388 != 0;
                int _392 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _394 = _392 != 0;
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _398 = _396 != 0;
                int _400 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _402 = _400 != 0;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _406 = _404 != 0;
                if (_390)
                {
                    _376 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _408 = _376;
                float _410 = _408;
                if (_390)
                {
                    _378 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _412 = _378;
                float _414 = _412;
                if (!_390)
                {
                    _410 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _416 = _410;
                if (!_390)
                {
                    _414 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _418 = _414;
                float _420 = _416 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _422 = _418 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _424 = _384;
                float _426 = _386;
                if (_402)
                {
                    float _428 = _420 * _384;
                    _424 = _428;
                }
                float _430 = _424;
                float _432 = -_420;
                float _434 = _432 + 1.0;
                int _436 = as_type<int>(_430);
                if (_406)
                {
                    float _438 = _422 * _386;
                    _426 = _438;
                }
                float _440 = _426;
                float _442 = -_422;
                float _444 = _442 + 1.0;
                float _446 = _440;
                if (_394)
                {
                    float _448 = _430 + _434;
                    _436 = as_type<int>(_448);
                }
                int _450 = _436;
                if (_398)
                {
                    float _452 = _440 + _444;
                    _446 = _452;
                }
                float _454 = _446;
                _380 = _450;
                _382 = _454;
            }
            int _456 = _380;
            float _458 = _382;
            int _460 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _462 = _460 != 0;
            int _464 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _466 = _464 != 0;
            int _468 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _470 = _468 != 0;
            int _472 = _456;
            int _474 = as_type<int>(_458);
            if (_466)
            {
                float _476 = -as_type<float>(_456);
                float _478 = _476 + 1.0;
                _472 = as_type<int>(_478);
            }
            int _480 = _472;
            if (_470)
            {
                float _482 = -_458;
                float _484 = _482 + 1.0;
                _474 = as_type<int>(_484);
            }
            int _486 = _474;
            bool _488 = !_462;
            float _490 = _488 ? as_type<float>(_480) : as_type<float>(_486);
            bool _492 = !_462;
            float _494 = _492 ? as_type<float>(_486) : as_type<float>(_480);
            _334 = _494;
            _336 = _490;
        }
    }
    _338 = false;
    float _496 = _334;
    float _498 = _336;
    float _500 = _496 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _502 = _496 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _504 = fma(_498, (*spvDescriptorSet0.vp_c3)._m0[10].x, _500);
    float _506 = fma(_498, (*spvDescriptorSet0.vp_c3)._m0[9].x, _502);
    float _508 = _504 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _510 = _506 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _512 = -_508;
    float _514 = _512 + 1.0;
    out.m_29.x = _510;
    out.m_29.y = _514;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _338 = false;
    bool _135 = false;
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
    float _81 = _75 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _75 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _75 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _107;
    out.gl_Position.z = _109;
    out.gl_Position.w = _111;
    bool _113 = !_51;
    float _131;
    float _133;
    if (!_113)
    {
        float _115 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _117 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _119 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _115);
        float _121 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _117);
        float _123 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].z, _119);
        float _125 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].z, _121);
        float _127 = _123 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _129 = _125 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _131 = _129;
        _133 = _127;
        _135 = true;
    }
    else
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _140 = _138 != 0;
        float _142 = _97;
        float _144 = _77;
        if (!_140)
        {
            float _146 = in.m_24.x;
            float _148 = in.m_24.y;
            _142 = _146;
            _144 = _148;
        }
        float _150 = _142;
        float _152 = _144;
        bool _154 = !_140;
        _131 = _152;
        _133 = _150;
        if (!_154)
        {
            int _156 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _158 = _156 != 0;
            float _160 = _150;
            float _162 = _152;
            if (!_158)
            {
                float _164 = in.m_24.x;
                float _166 = in.m_24.y;
                _160 = _164;
                _162 = _166;
            }
            float _168 = _160;
            float _170 = _162;
            bool _172 = !_158;
            float _174 = _170;
            float _176 = _168;
            int _178 = as_type<int>(_168);
            float _180 = _170;
            if (!_172)
            {
                float _182 = in.m_24.x;
                float _184 = in.m_24.y;
                int _186 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _188 = _186 != 0;
                int _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _192 = _190 != 0;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _204 = _202 != 0;
                if (_188)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _206 = _174;
                float _208 = _206;
                if (_188)
                {
                    _176 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _210 = _176;
                float _212 = _210;
                if (!_188)
                {
                    _208 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _214 = _208;
                if (!_188)
                {
                    _212 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _216 = _212;
                float _218 = _214 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _222 = _182;
                float _224 = _184;
                if (_200)
                {
                    float _226 = _218 * _182;
                    _222 = _226;
                }
                float _228 = _222;
                float _230 = -_218;
                float _232 = _230 + 1.0;
                int _234 = as_type<int>(_228);
                if (_204)
                {
                    float _236 = _220 * _184;
                    _224 = _236;
                }
                float _238 = _224;
                float _240 = -_220;
                float _242 = _240 + 1.0;
                float _244 = _238;
                if (_192)
                {
                    float _246 = _228 + _232;
                    _234 = as_type<int>(_246);
                }
                int _248 = _234;
                if (_196)
                {
                    float _250 = _238 + _242;
                    _244 = _250;
                }
                float _252 = _244;
                _178 = _248;
                _180 = _252;
            }
            int _254 = _178;
            float _256 = _180;
            int _258 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _260 = _258 != 0;
            int _262 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _264 = _262 != 0;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _268 = _266 != 0;
            int _270 = _254;
            int _272 = as_type<int>(_256);
            if (_264)
            {
                float _274 = -as_type<float>(_254);
                float _276 = _274 + 1.0;
                _270 = as_type<int>(_276);
            }
            int _278 = _270;
            if (_268)
            {
                float _280 = -_256;
                float _282 = _280 + 1.0;
                _272 = as_type<int>(_282);
            }
            int _284 = _272;
            bool _286 = !_260;
            float _288 = _286 ? as_type<float>(_278) : as_type<float>(_284);
            bool _290 = !_260;
            float _292 = _290 ? as_type<float>(_284) : as_type<float>(_278);
            _131 = _292;
            _133 = _288;
        }
    }
    _135 = false;
    float _294 = _131;
    float _296 = _133;
    float _298 = _294 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _300 = _294 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _302 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _304 = fma(_296, (*spvDescriptorSet0.vp_c3)._m0[8].x, _298);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c3)._m0[7].x, _300);
    float _308 = _304 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _310 = _306 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _312 = -_308;
    float _314 = _312 + 1.0;
    out.m_27.x = _310;
    out.m_27.y = _314;
    bool _316 = !_302;
    float _334;
    float _336;
    if (!_316)
    {
        float _318 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _320 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _322 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _318);
        float _324 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _320);
        float _326 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _322);
        float _328 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _324);
        float _330 = _326 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _332 = _328 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _334 = _332;
        _336 = _330;
        _338 = true;
    }
    else
    {
        int _340 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _342 = _340 != 0;
        float _344 = _310;
        float _346 = _314;
        if (!_342)
        {
            float _348 = in.m_24.x;
            float _350 = in.m_24.y;
            _344 = _348;
            _346 = _350;
        }
        float _352 = _344;
        float _354 = _346;
        bool _356 = !_342;
        _334 = _354;
        _336 = _352;
        if (!_356)
        {
            int _358 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _360 = _358 != 0;
            float _362 = _352;
            float _364 = _354;
            if (!_360)
            {
                float _366 = in.m_24.x;
                float _368 = in.m_24.y;
                _362 = _366;
                _364 = _368;
            }
            float _370 = _362;
            float _372 = _364;
            bool _374 = !_360;
            float _376 = _372;
            float _378 = _370;
            int _380 = as_type<int>(_370);
            float _382 = _372;
            if (!_374)
            {
                float _384 = in.m_24.x;
                float _386 = in.m_24.y;
                int _388 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _390 = _388 != 0;
                int _392 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _394 = _392 != 0;
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _398 = _396 != 0;
                int _400 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _402 = _400 != 0;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _406 = _404 != 0;
                if (_390)
                {
                    _376 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _408 = _376;
                float _410 = _408;
                if (_390)
                {
                    _378 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _412 = _378;
                float _414 = _412;
                if (!_390)
                {
                    _410 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _416 = _410;
                if (!_390)
                {
                    _414 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _418 = _414;
                float _420 = _416 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _422 = _418 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _424 = _384;
                float _426 = _386;
                if (_402)
                {
                    float _428 = _420 * _384;
                    _424 = _428;
                }
                float _430 = _424;
                float _432 = -_420;
                float _434 = _432 + 1.0;
                int _436 = as_type<int>(_430);
                if (_406)
                {
                    float _438 = _422 * _386;
                    _426 = _438;
                }
                float _440 = _426;
                float _442 = -_422;
                float _444 = _442 + 1.0;
                float _446 = _440;
                if (_394)
                {
                    float _448 = _430 + _434;
                    _436 = as_type<int>(_448);
                }
                int _450 = _436;
                if (_398)
                {
                    float _452 = _440 + _444;
                    _446 = _452;
                }
                float _454 = _446;
                _380 = _450;
                _382 = _454;
            }
            int _456 = _380;
            float _458 = _382;
            int _460 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _462 = _460 != 0;
            int _464 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _466 = _464 != 0;
            int _468 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _470 = _468 != 0;
            int _472 = _456;
            int _474 = as_type<int>(_458);
            if (_466)
            {
                float _476 = -as_type<float>(_456);
                float _478 = _476 + 1.0;
                _472 = as_type<int>(_478);
            }
            int _480 = _472;
            if (_470)
            {
                float _482 = -_458;
                float _484 = _482 + 1.0;
                _474 = as_type<int>(_484);
            }
            int _486 = _474;
            bool _488 = !_462;
            float _490 = _488 ? as_type<float>(_480) : as_type<float>(_486);
            bool _492 = !_462;
            float _494 = _492 ? as_type<float>(_486) : as_type<float>(_480);
            _334 = _494;
            _336 = _490;
        }
    }
    _338 = false;
    float _496 = _334;
    float _498 = _336;
    float _500 = _496 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _502 = _496 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _504 = fma(_498, (*spvDescriptorSet0.vp_c3)._m0[10].x, _500);
    float _506 = fma(_498, (*spvDescriptorSet0.vp_c3)._m0[9].x, _502);
    float _508 = _504 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _510 = _506 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _512 = -_508;
    float _514 = _512 + 1.0;
    out.m_29.x = _510;
    out.m_29.y = _514;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _338 = false;
    bool _135 = false;
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
    float _81 = _75 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _75 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _75 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _107;
    out.gl_Position.z = _109;
    out.gl_Position.w = _111;
    bool _113 = !_51;
    float _131;
    float _133;
    if (!_113)
    {
        float _115 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _117 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _119 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _115);
        float _121 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _117);
        float _123 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].z, _119);
        float _125 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].z, _121);
        float _127 = _123 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _129 = _125 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _131 = _129;
        _133 = _127;
        _135 = true;
    }
    else
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _140 = _138 != 0;
        float _142 = _97;
        float _144 = _77;
        if (!_140)
        {
            float _146 = in.m_24.x;
            float _148 = in.m_24.y;
            _142 = _146;
            _144 = _148;
        }
        float _150 = _142;
        float _152 = _144;
        bool _154 = !_140;
        _131 = _152;
        _133 = _150;
        if (!_154)
        {
            int _156 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _158 = _156 != 0;
            float _160 = _150;
            float _162 = _152;
            if (!_158)
            {
                float _164 = in.m_24.x;
                float _166 = in.m_24.y;
                _160 = _164;
                _162 = _166;
            }
            float _168 = _160;
            float _170 = _162;
            bool _172 = !_158;
            float _174 = _170;
            float _176 = _168;
            int _178 = as_type<int>(_168);
            float _180 = _170;
            if (!_172)
            {
                float _182 = in.m_24.x;
                float _184 = in.m_24.y;
                int _186 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _188 = _186 != 0;
                int _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _192 = _190 != 0;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _204 = _202 != 0;
                if (_188)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _206 = _174;
                float _208 = _206;
                if (_188)
                {
                    _176 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _210 = _176;
                float _212 = _210;
                if (!_188)
                {
                    _208 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _214 = _208;
                if (!_188)
                {
                    _212 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _216 = _212;
                float _218 = _214 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _222 = _182;
                float _224 = _184;
                if (_200)
                {
                    float _226 = _218 * _182;
                    _222 = _226;
                }
                float _228 = _222;
                float _230 = -_218;
                float _232 = _230 + 1.0;
                int _234 = as_type<int>(_228);
                if (_204)
                {
                    float _236 = _220 * _184;
                    _224 = _236;
                }
                float _238 = _224;
                float _240 = -_220;
                float _242 = _240 + 1.0;
                float _244 = _238;
                if (_192)
                {
                    float _246 = _228 + _232;
                    _234 = as_type<int>(_246);
                }
                int _248 = _234;
                if (_196)
                {
                    float _250 = _238 + _242;
                    _244 = _250;
                }
                float _252 = _244;
                _178 = _248;
                _180 = _252;
            }
            int _254 = _178;
            float _256 = _180;
            int _258 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _260 = _258 != 0;
            int _262 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _264 = _262 != 0;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _268 = _266 != 0;
            int _270 = _254;
            int _272 = as_type<int>(_256);
            if (_264)
            {
                float _274 = -as_type<float>(_254);
                float _276 = _274 + 1.0;
                _270 = as_type<int>(_276);
            }
            int _278 = _270;
            if (_268)
            {
                float _280 = -_256;
                float _282 = _280 + 1.0;
                _272 = as_type<int>(_282);
            }
            int _284 = _272;
            bool _286 = !_260;
            float _288 = _286 ? as_type<float>(_278) : as_type<float>(_284);
            bool _290 = !_260;
            float _292 = _290 ? as_type<float>(_284) : as_type<float>(_278);
            _131 = _292;
            _133 = _288;
        }
    }
    _135 = false;
    float _294 = _131;
    float _296 = _133;
    float _298 = _294 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _300 = _294 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _302 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _304 = fma(_296, (*spvDescriptorSet0.vp_c3)._m0[8].x, _298);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c3)._m0[7].x, _300);
    float _308 = _304 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _310 = _306 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _312 = -_308;
    float _314 = _312 + 1.0;
    out.m_27.x = _310;
    out.m_27.y = _314;
    bool _316 = !_302;
    float _334;
    float _336;
    if (!_316)
    {
        float _318 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _320 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _322 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _318);
        float _324 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _320);
        float _326 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _322);
        float _328 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _324);
        float _330 = _326 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _332 = _328 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _334 = _332;
        _336 = _330;
        _338 = true;
    }
    else
    {
        int _340 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _342 = _340 != 0;
        float _344 = _310;
        float _346 = _314;
        if (!_342)
        {
            float _348 = in.m_24.x;
            float _350 = in.m_24.y;
            _344 = _348;
            _346 = _350;
        }
        float _352 = _344;
        float _354 = _346;
        bool _356 = !_342;
        _334 = _354;
        _336 = _352;
        if (!_356)
        {
            int _358 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _360 = _358 != 0;
            float _362 = _352;
            float _364 = _354;
            if (!_360)
            {
                float _366 = in.m_24.x;
                float _368 = in.m_24.y;
                _362 = _366;
                _364 = _368;
            }
            float _370 = _362;
            float _372 = _364;
            bool _374 = !_360;
            float _376 = _372;
            float _378 = _370;
            int _380 = as_type<int>(_370);
            float _382 = _372;
            if (!_374)
            {
                float _384 = in.m_24.x;
                float _386 = in.m_24.y;
                int _388 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _390 = _388 != 0;
                int _392 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _394 = _392 != 0;
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _398 = _396 != 0;
                int _400 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _402 = _400 != 0;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _406 = _404 != 0;
                if (_390)
                {
                    _376 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _408 = _376;
                float _410 = _408;
                if (_390)
                {
                    _378 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _412 = _378;
                float _414 = _412;
                if (!_390)
                {
                    _410 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _416 = _410;
                if (!_390)
                {
                    _414 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _418 = _414;
                float _420 = _416 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _422 = _418 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _424 = _384;
                float _426 = _386;
                if (_402)
                {
                    float _428 = _420 * _384;
                    _424 = _428;
                }
                float _430 = _424;
                float _432 = -_420;
                float _434 = _432 + 1.0;
                int _436 = as_type<int>(_430);
                if (_406)
                {
                    float _438 = _422 * _386;
                    _426 = _438;
                }
                float _440 = _426;
                float _442 = -_422;
                float _444 = _442 + 1.0;
                float _446 = _440;
                if (_394)
                {
                    float _448 = _430 + _434;
                    _436 = as_type<int>(_448);
                }
                int _450 = _436;
                if (_398)
                {
                    float _452 = _440 + _444;
                    _446 = _452;
                }
                float _454 = _446;
                _380 = _450;
                _382 = _454;
            }
            int _456 = _380;
            float _458 = _382;
            int _460 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _462 = _460 != 0;
            int _464 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _466 = _464 != 0;
            int _468 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _470 = _468 != 0;
            int _472 = _456;
            int _474 = as_type<int>(_458);
            if (_466)
            {
                float _476 = -as_type<float>(_456);
                float _478 = _476 + 1.0;
                _472 = as_type<int>(_478);
            }
            int _480 = _472;
            if (_470)
            {
                float _482 = -_458;
                float _484 = _482 + 1.0;
                _474 = as_type<int>(_484);
            }
            int _486 = _474;
            bool _488 = !_462;
            float _490 = _488 ? as_type<float>(_480) : as_type<float>(_486);
            bool _492 = !_462;
            float _494 = _492 ? as_type<float>(_486) : as_type<float>(_480);
            _334 = _494;
            _336 = _490;
        }
    }
    _338 = false;
    float _496 = _334;
    float _498 = _336;
    float _500 = _496 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _502 = _496 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _504 = fma(_498, (*spvDescriptorSet0.vp_c3)._m0[10].x, _500);
    float _506 = fma(_498, (*spvDescriptorSet0.vp_c3)._m0[9].x, _502);
    float _508 = _504 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _510 = _506 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _512 = -_508;
    float _514 = _512 + 1.0;
    out.m_29.x = _510;
    out.m_29.y = _514;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


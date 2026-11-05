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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>(in.m_36.y);
    float _64 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _66 = in.m_39.x;
    float _68 = in.m_39.y;
    float _70 = in.m_39.z;
    float _72 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _74 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _72;
    float _76 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _78 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _76;
    float _80 = _74 * _74;
    int _83 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _85 = _83 + as_type<int>(_60);
    int _87 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _89 = _87 + as_type<int>(_62);
    int _91 = _85 * 48;
    int _93 = _89 * 48;
    int _95 = _91 + 16;
    int _97 = _93 + 16;
    int _99 = _93 + 32;
    int _101 = _93 + 48;
    uint _104 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw0.x);
    int _108 = _95 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.y);
    int _114 = _95 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.z);
    int _120 = _95 + 12;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw0.w);
    int _126 = _91 + 32;
    int _128 = _91 + 48;
    uint _130 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw3.x);
    int _134 = _97 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw3.y);
    int _140 = _97 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw3.z);
    int _146 = _97 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw3.w);
    uint _152 = uint(int(uint(_99) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_152)];
    float _154 = as_type<float>(_dmw4.x);
    int _156 = _99 + 4;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw4.y);
    int _162 = _99 + 8;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>(_dmw4.z);
    int _168 = _99 + 12;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw4.w);
    uint _174 = uint(int(uint(_101) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_174)];
    float _176 = as_type<float>(_dmw5.x);
    int _178 = _101 + 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw5.y);
    int _184 = _101 + 8;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_dmw5.z);
    int _190 = _101 + 12;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>(_dmw5.w);
    uint _196 = uint(int(uint(_126) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_196)];
    float _198 = as_type<float>(_dmw1.x);
    int _200 = _126 + 4;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>(_dmw1.y);
    int _206 = _126 + 8;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>(_dmw1.z);
    int _212 = _126 + 12;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>(_dmw1.w);
    uint _218 = uint(int(uint(_128) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_218)];
    float _220 = as_type<float>(_dmw2.x);
    int _222 = _128 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>(_dmw2.y);
    int _228 = _128 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>(_dmw2.z);
    int _234 = _128 + 12;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>(_dmw2.w);
    float _240 = fma(_78, _78, _80);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _244 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _242;
    float _246 = fma(_244, _244, _240);
    float _248 = in.m_41.x;
    float _250 = in.m_41.y;
    float _252 = sqrt(_246);
    bool _256 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _264 = _260 || _262;
    float _266 = _112 * _68;
    float _268 = _138 * _68;
    float _270 = _160 * _68;
    float _272 = _182 * _68;
    float _274 = fma(_132, _66, _268);
    float _276 = fma(_154, _66, _270);
    float _278 = _204 * _68;
    float _280 = fma(_176, _66, _272);
    float _282 = _226 * _68;
    float _284 = fma(_106, _66, _266);
    float _286 = fma(_198, _66, _278);
    float _288 = fma(_144, _70, _274);
    float _290 = fma(_220, _66, _282);
    float _292 = fma(_166, _70, _276);
    float _294 = fma(_188, _70, _280);
    float _296 = fma(_118, _70, _284);
    float _298 = fma(_210, _70, _286);
    float _300 = fma(_232, _70, _290);
    float _302 = _150 + _288;
    float _304 = _172 + _292;
    float _306 = _194 + _294;
    float _308 = _124 + _296;
    float _310 = _216 + _298;
    float _312 = _238 + _300;
    float _314 = _302 * _250;
    float _316 = _304 * _250;
    float _318 = _306 * _250;
    float _320 = _198;
    if (!_264)
    {
        _320 = 1.0;
    }
    float _322 = _320;
    float _324 = fma(_308, _248, _314);
    float _326 = fma(_310, _248, _316);
    float _328 = fma(_312, _248, _318);
    bool _330 = !_264;
    float _332 = _322;
    if (!_330)
    {
        bool _334 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _336 = isnan(_252);
        bool _338 = _334 || _336;
        bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _342 = _338 || _340;
        if (!_342)
        {
            float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _346 = _252 + _344;
            float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _350 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _348;
            float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _356 = 1.0 / _350;
            float _358 = _346 * _356;
            float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _332 = _360;
            _362 = true;
        }
        else
        {
            bool _364 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _366 = isnan(_252);
            bool _368 = _364 || _366;
            bool _370 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _372 = _368 || _370;
            if (!_372)
            {
                float _374 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _376 = _252 + _374;
                float _378 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _380 = _378 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _382 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _384 = _382 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _386 = 1.0 / _380;
                float _388 = _376 * _386;
                float _390 = fma(_388, _384, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _332 = _390;
                _362 = true;
            }
            else
            {
                _332 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _362 = false;
    float _392 = _332;
    float _394 = _392 + (-1.0);
    float _396 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _398 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _400 = fma(_326, _392, _396);
    float _402 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _404 = fma(_324, _392, _398);
    float _406 = _400 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _408 = fma(_328, _392, _402);
    float _410 = _400 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _412 = _400 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[2].x, _406);
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[0].x, _410);
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[1].x, _412);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[2].z, _414);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[0].z, _416);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[1].z, _418);
    float _426 = _420 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _428 = _422 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _430 = _424 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _438 = _428 + _436;
    float _440 = _434 * _434;
    float _442 = fma(_438, _438, _440);
    float _444 = _430 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _446 = sqrt(_442);
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c4)._m0[2].x, _444);
    float _450 = fma(_426, (*spvDescriptorSet0.vp_c4)._m0[2].z, _448);
    float _452 = _450 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _454 = _446 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _456 = _404;
    float _458 = _450;
    float _460 = _428;
    float _462 = _452;
    if (!_454)
    {
        _456 = _428;
    }
    float _464 = _456;
    float _466 = _464;
    if (!_454)
    {
        _458 = _426;
    }
    float _468 = _458;
    float _470 = _468;
    if (!_454)
    {
        _460 = _430;
    }
    float _472 = _460;
    bool _474 = !_454;
    float _476 = _472;
    if (!_474)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _482 = _446 + _480;
        float _484 = _430 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _486 = rsqrt(_442);
        float _488 = _482 * _478;
        float _490 = _488 * 0.15915493667125701904296875;
        float _492 = _490 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 + (-1.0);
        float _502 = _500 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _504 = fma(_498, _484, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _506 = fma(_430, _494, _502);
        float _508 = _486 * _504;
        float _510 = _506 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _512 = fma(_438, _508, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _514 = fma(_434, _508, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _516 = fma(_512, (*spvDescriptorSet0.vp_c4)._m0[2].x, _510);
        float _518 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[2].z, _516);
        float _520 = _518 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _476 = _506;
        _466 = _512;
        _470 = _514;
        _462 = _520;
    }
    float _522 = _476;
    float _524 = _466;
    float _526 = _470;
    float _528 = _462;
    float _530 = _522 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _532 = _522 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _534 = in.m_43.x;
    float _536 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[1].x, _530);
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[0].x, _532);
    float _540 = in.m_43.y;
    float _542 = fma(_526, (*spvDescriptorSet0.vp_c4)._m0[1].z, _536);
    float _544 = fma(_526, (*spvDescriptorSet0.vp_c4)._m0[0].z, _538);
    float _546 = _542 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _548 = _544 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _550 = _546 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _552 = _546 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _556 = _546 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _558 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[8].x, _550);
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[7].x, _552);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[9].x, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[10].x, _556);
    float _566 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[8].z, _558);
    float _568 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[7].z, _560);
    float _570 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[9].z, _562);
    float _572 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[10].z, _564);
    float _574 = _568 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _576 = _566 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _578 = _570 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _580 = _572 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _534;
    out.m_46.y = _540;
    out.gl_Position.x = _574;
    out.gl_Position.y = _576;
    out.gl_Position.z = _578;
    out.gl_Position.w = _580;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>(in.m_36.y);
    float _64 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _66 = in.m_39.x;
    float _68 = in.m_39.y;
    float _70 = in.m_39.z;
    float _72 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _74 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _72;
    float _76 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _78 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _76;
    float _80 = _74 * _74;
    int _83 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _85 = _83 + as_type<int>(_60);
    int _87 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _89 = _87 + as_type<int>(_62);
    int _91 = _85 * 48;
    int _93 = _89 * 48;
    int _95 = _91 + 16;
    int _97 = _93 + 16;
    int _99 = _93 + 32;
    int _101 = _93 + 48;
    uint _104 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw0.x);
    int _108 = _95 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.y);
    int _114 = _95 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.z);
    int _120 = _95 + 12;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw0.w);
    int _126 = _91 + 32;
    int _128 = _91 + 48;
    uint _130 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw3.x);
    int _134 = _97 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw3.y);
    int _140 = _97 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw3.z);
    int _146 = _97 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw3.w);
    uint _152 = uint(int(uint(_99) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_152)];
    float _154 = as_type<float>(_dmw4.x);
    int _156 = _99 + 4;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw4.y);
    int _162 = _99 + 8;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>(_dmw4.z);
    int _168 = _99 + 12;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw4.w);
    uint _174 = uint(int(uint(_101) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_174)];
    float _176 = as_type<float>(_dmw5.x);
    int _178 = _101 + 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw5.y);
    int _184 = _101 + 8;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_dmw5.z);
    int _190 = _101 + 12;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>(_dmw5.w);
    uint _196 = uint(int(uint(_126) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_196)];
    float _198 = as_type<float>(_dmw1.x);
    int _200 = _126 + 4;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>(_dmw1.y);
    int _206 = _126 + 8;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>(_dmw1.z);
    int _212 = _126 + 12;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>(_dmw1.w);
    uint _218 = uint(int(uint(_128) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_218)];
    float _220 = as_type<float>(_dmw2.x);
    int _222 = _128 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>(_dmw2.y);
    int _228 = _128 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>(_dmw2.z);
    int _234 = _128 + 12;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>(_dmw2.w);
    float _240 = fma(_78, _78, _80);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _244 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _242;
    float _246 = fma(_244, _244, _240);
    float _248 = in.m_41.x;
    float _250 = in.m_41.y;
    float _252 = sqrt(_246);
    bool _256 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _264 = _260 || _262;
    float _266 = _112 * _68;
    float _268 = _138 * _68;
    float _270 = _160 * _68;
    float _272 = _182 * _68;
    float _274 = fma(_132, _66, _268);
    float _276 = fma(_154, _66, _270);
    float _278 = _204 * _68;
    float _280 = fma(_176, _66, _272);
    float _282 = _226 * _68;
    float _284 = fma(_106, _66, _266);
    float _286 = fma(_198, _66, _278);
    float _288 = fma(_144, _70, _274);
    float _290 = fma(_220, _66, _282);
    float _292 = fma(_166, _70, _276);
    float _294 = fma(_188, _70, _280);
    float _296 = fma(_118, _70, _284);
    float _298 = fma(_210, _70, _286);
    float _300 = fma(_232, _70, _290);
    float _302 = _150 + _288;
    float _304 = _172 + _292;
    float _306 = _194 + _294;
    float _308 = _124 + _296;
    float _310 = _216 + _298;
    float _312 = _238 + _300;
    float _314 = _302 * _250;
    float _316 = _304 * _250;
    float _318 = _306 * _250;
    float _320 = _198;
    if (!_264)
    {
        _320 = 1.0;
    }
    float _322 = _320;
    float _324 = fma(_308, _248, _314);
    float _326 = fma(_310, _248, _316);
    float _328 = fma(_312, _248, _318);
    bool _330 = !_264;
    float _332 = _322;
    if (!_330)
    {
        bool _334 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _336 = isnan(_252);
        bool _338 = _334 || _336;
        bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _342 = _338 || _340;
        if (!_342)
        {
            float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _346 = _252 + _344;
            float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _350 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _348;
            float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _356 = 1.0 / _350;
            float _358 = _346 * _356;
            float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _332 = _360;
            _362 = true;
        }
        else
        {
            bool _364 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _366 = isnan(_252);
            bool _368 = _364 || _366;
            bool _370 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _372 = _368 || _370;
            if (!_372)
            {
                float _374 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _376 = _252 + _374;
                float _378 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _380 = _378 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _382 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _384 = _382 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _386 = 1.0 / _380;
                float _388 = _376 * _386;
                float _390 = fma(_388, _384, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _332 = _390;
                _362 = true;
            }
            else
            {
                _332 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _362 = false;
    float _392 = _332;
    float _394 = _392 + (-1.0);
    float _396 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _398 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _400 = fma(_326, _392, _396);
    float _402 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _404 = fma(_324, _392, _398);
    float _406 = _400 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _408 = fma(_328, _392, _402);
    float _410 = _400 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _412 = _400 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[2].x, _406);
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[0].x, _410);
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[1].x, _412);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[2].z, _414);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[0].z, _416);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[1].z, _418);
    float _426 = _420 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _428 = _422 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _430 = _424 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _438 = _428 + _436;
    float _440 = _434 * _434;
    float _442 = fma(_438, _438, _440);
    float _444 = _430 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _446 = sqrt(_442);
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c4)._m0[2].x, _444);
    float _450 = fma(_426, (*spvDescriptorSet0.vp_c4)._m0[2].z, _448);
    float _452 = _450 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _454 = _446 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _456 = _404;
    float _458 = _450;
    float _460 = _428;
    float _462 = _452;
    if (!_454)
    {
        _456 = _428;
    }
    float _464 = _456;
    float _466 = _464;
    if (!_454)
    {
        _458 = _426;
    }
    float _468 = _458;
    float _470 = _468;
    if (!_454)
    {
        _460 = _430;
    }
    float _472 = _460;
    bool _474 = !_454;
    float _476 = _472;
    if (!_474)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _482 = _446 + _480;
        float _484 = _430 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _486 = rsqrt(_442);
        float _488 = _482 * _478;
        float _490 = _488 * 0.15915493667125701904296875;
        float _492 = _490 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 + (-1.0);
        float _502 = _500 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _504 = fma(_498, _484, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _506 = fma(_430, _494, _502);
        float _508 = _486 * _504;
        float _510 = _506 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _512 = fma(_438, _508, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _514 = fma(_434, _508, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _516 = fma(_512, (*spvDescriptorSet0.vp_c4)._m0[2].x, _510);
        float _518 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[2].z, _516);
        float _520 = _518 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _476 = _506;
        _466 = _512;
        _470 = _514;
        _462 = _520;
    }
    float _522 = _476;
    float _524 = _466;
    float _526 = _470;
    float _528 = _462;
    float _530 = _522 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _532 = _522 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _534 = in.m_43.x;
    float _536 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[1].x, _530);
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[0].x, _532);
    float _540 = in.m_43.y;
    float _542 = fma(_526, (*spvDescriptorSet0.vp_c4)._m0[1].z, _536);
    float _544 = fma(_526, (*spvDescriptorSet0.vp_c4)._m0[0].z, _538);
    float _546 = _542 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _548 = _544 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _550 = _546 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _552 = _546 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _556 = _546 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _558 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[8].x, _550);
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[7].x, _552);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[9].x, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[10].x, _556);
    float _566 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[8].z, _558);
    float _568 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[7].z, _560);
    float _570 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[9].z, _562);
    float _572 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[10].z, _564);
    float _574 = _568 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _576 = _566 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _578 = _570 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _580 = _572 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _534;
    out.m_46.y = _540;
    out.gl_Position.x = _574;
    out.gl_Position.y = _576;
    out.gl_Position.z = _578;
    out.gl_Position.w = _580;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>(in.m_36.y);
    float _64 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _66 = in.m_39.x;
    float _68 = in.m_39.y;
    float _70 = in.m_39.z;
    float _72 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _74 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _72;
    float _76 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _78 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _76;
    float _80 = _74 * _74;
    int _83 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _85 = _83 + as_type<int>(_60);
    int _87 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _89 = _87 + as_type<int>(_62);
    int _91 = _85 * 48;
    int _93 = _89 * 48;
    int _95 = _91 + 16;
    int _97 = _93 + 16;
    int _99 = _93 + 32;
    int _101 = _93 + 48;
    uint _104 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw0.x);
    int _108 = _95 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.y);
    int _114 = _95 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.z);
    int _120 = _95 + 12;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw0.w);
    int _126 = _91 + 32;
    int _128 = _91 + 48;
    uint _130 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw3.x);
    int _134 = _97 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw3.y);
    int _140 = _97 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw3.z);
    int _146 = _97 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw3.w);
    uint _152 = uint(int(uint(_99) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_152)];
    float _154 = as_type<float>(_dmw4.x);
    int _156 = _99 + 4;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw4.y);
    int _162 = _99 + 8;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>(_dmw4.z);
    int _168 = _99 + 12;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw4.w);
    uint _174 = uint(int(uint(_101) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_174)];
    float _176 = as_type<float>(_dmw5.x);
    int _178 = _101 + 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw5.y);
    int _184 = _101 + 8;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_dmw5.z);
    int _190 = _101 + 12;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>(_dmw5.w);
    uint _196 = uint(int(uint(_126) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_196)];
    float _198 = as_type<float>(_dmw1.x);
    int _200 = _126 + 4;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>(_dmw1.y);
    int _206 = _126 + 8;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>(_dmw1.z);
    int _212 = _126 + 12;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>(_dmw1.w);
    uint _218 = uint(int(uint(_128) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_218)];
    float _220 = as_type<float>(_dmw2.x);
    int _222 = _128 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>(_dmw2.y);
    int _228 = _128 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>(_dmw2.z);
    int _234 = _128 + 12;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>(_dmw2.w);
    float _240 = fma(_78, _78, _80);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _244 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _242;
    float _246 = fma(_244, _244, _240);
    float _248 = in.m_41.x;
    float _250 = in.m_41.y;
    float _252 = sqrt(_246);
    bool _256 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _264 = _260 || _262;
    float _266 = _112 * _68;
    float _268 = _138 * _68;
    float _270 = _160 * _68;
    float _272 = _182 * _68;
    float _274 = fma(_132, _66, _268);
    float _276 = fma(_154, _66, _270);
    float _278 = _204 * _68;
    float _280 = fma(_176, _66, _272);
    float _282 = _226 * _68;
    float _284 = fma(_106, _66, _266);
    float _286 = fma(_198, _66, _278);
    float _288 = fma(_144, _70, _274);
    float _290 = fma(_220, _66, _282);
    float _292 = fma(_166, _70, _276);
    float _294 = fma(_188, _70, _280);
    float _296 = fma(_118, _70, _284);
    float _298 = fma(_210, _70, _286);
    float _300 = fma(_232, _70, _290);
    float _302 = _150 + _288;
    float _304 = _172 + _292;
    float _306 = _194 + _294;
    float _308 = _124 + _296;
    float _310 = _216 + _298;
    float _312 = _238 + _300;
    float _314 = _302 * _250;
    float _316 = _304 * _250;
    float _318 = _306 * _250;
    float _320 = _198;
    if (!_264)
    {
        _320 = 1.0;
    }
    float _322 = _320;
    float _324 = fma(_308, _248, _314);
    float _326 = fma(_310, _248, _316);
    float _328 = fma(_312, _248, _318);
    bool _330 = !_264;
    float _332 = _322;
    if (!_330)
    {
        bool _334 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _336 = isnan(_252);
        bool _338 = _334 || _336;
        bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _342 = _338 || _340;
        if (!_342)
        {
            float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _346 = _252 + _344;
            float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _350 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _348;
            float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _356 = 1.0 / _350;
            float _358 = _346 * _356;
            float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _332 = _360;
            _362 = true;
        }
        else
        {
            bool _364 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _366 = isnan(_252);
            bool _368 = _364 || _366;
            bool _370 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _372 = _368 || _370;
            if (!_372)
            {
                float _374 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _376 = _252 + _374;
                float _378 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _380 = _378 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _382 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _384 = _382 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _386 = 1.0 / _380;
                float _388 = _376 * _386;
                float _390 = fma(_388, _384, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _332 = _390;
                _362 = true;
            }
            else
            {
                _332 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _362 = false;
    float _392 = _332;
    float _394 = _392 + (-1.0);
    float _396 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _398 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _400 = fma(_326, _392, _396);
    float _402 = _394 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _404 = fma(_324, _392, _398);
    float _406 = _400 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _408 = fma(_328, _392, _402);
    float _410 = _400 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _412 = _400 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[2].x, _406);
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[0].x, _410);
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[1].x, _412);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[2].z, _414);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[0].z, _416);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c7)._m0[1].z, _418);
    float _426 = _420 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _428 = _422 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _430 = _424 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _438 = _428 + _436;
    float _440 = _434 * _434;
    float _442 = fma(_438, _438, _440);
    float _444 = _430 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _446 = sqrt(_442);
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c4)._m0[2].x, _444);
    float _450 = fma(_426, (*spvDescriptorSet0.vp_c4)._m0[2].z, _448);
    float _452 = _450 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _454 = _446 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _456 = _404;
    float _458 = _450;
    float _460 = _428;
    float _462 = _452;
    if (!_454)
    {
        _456 = _428;
    }
    float _464 = _456;
    float _466 = _464;
    if (!_454)
    {
        _458 = _426;
    }
    float _468 = _458;
    float _470 = _468;
    if (!_454)
    {
        _460 = _430;
    }
    float _472 = _460;
    bool _474 = !_454;
    float _476 = _472;
    if (!_474)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _482 = _446 + _480;
        float _484 = _430 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _486 = rsqrt(_442);
        float _488 = _482 * _478;
        float _490 = _488 * 0.15915493667125701904296875;
        float _492 = _490 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 + (-1.0);
        float _502 = _500 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _504 = fma(_498, _484, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _506 = fma(_430, _494, _502);
        float _508 = _486 * _504;
        float _510 = _506 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _512 = fma(_438, _508, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _514 = fma(_434, _508, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _516 = fma(_512, (*spvDescriptorSet0.vp_c4)._m0[2].x, _510);
        float _518 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[2].z, _516);
        float _520 = _518 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _476 = _506;
        _466 = _512;
        _470 = _514;
        _462 = _520;
    }
    float _522 = _476;
    float _524 = _466;
    float _526 = _470;
    float _528 = _462;
    float _530 = _522 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _532 = _522 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _534 = in.m_43.x;
    float _536 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[1].x, _530);
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[0].x, _532);
    float _540 = in.m_43.y;
    float _542 = fma(_526, (*spvDescriptorSet0.vp_c4)._m0[1].z, _536);
    float _544 = fma(_526, (*spvDescriptorSet0.vp_c4)._m0[0].z, _538);
    float _546 = _542 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _548 = _544 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _550 = _546 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _552 = _546 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _556 = _546 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _558 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[8].x, _550);
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[7].x, _552);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[9].x, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[10].x, _556);
    float _566 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[8].z, _558);
    float _568 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[7].z, _560);
    float _570 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[9].z, _562);
    float _572 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[10].z, _564);
    float _574 = _568 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _576 = _566 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _578 = _570 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _580 = _572 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _534;
    out.m_46.y = _540;
    out.gl_Position.x = _574;
    out.gl_Position.y = _576;
    out.gl_Position.z = _578;
    out.gl_Position.w = _580;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


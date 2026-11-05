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
    constant _16* vp_c5 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_32 [[attribute(4)]];
    uint4 m_29 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(in.m_29.x);
    float _50 = as_type<float>(in.m_29.y);
    float _52 = in.m_32.x;
    float _54 = in.m_32.y;
    float _56 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _58 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _56;
    float _60 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _62 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _60;
    float _64 = _58 * _58;
    float _66 = fma(_62, _62, _64);
    int _69 = as_type<int>(_48) * 48;
    int _71 = as_type<int>(_50) * 48;
    uint _74 = uint(int(uint(_69) >> uint(2)));
    uint _76 = uint(int(uint(int(_74)) >> uint(2)));
    int _78 = int(_74) & 3;
    float _80 = (*spvDescriptorSet0.vp_c5)._m0[int(_76)][_78];
    int _82 = int(_74) + 1;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    int _86 = _82 & 3;
    float _88 = (*spvDescriptorSet0.vp_c5)._m0[int(_84)][_86];
    float _90 = in.m_34.x;
    float _92 = in.m_34.y;
    float _94 = in.m_34.z;
    int _96 = _69 + 16;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c5)._m0[int(_100)][_102];
    int _106 = int(_98) + 1;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    int _110 = _106 & 3;
    float _112 = (*spvDescriptorSet0.vp_c5)._m0[int(_108)][_110];
    int _114 = _69 + 32;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    uint _118 = uint(int(uint(int(_116)) >> uint(2)));
    int _120 = int(_116) & 3;
    float _122 = (*spvDescriptorSet0.vp_c5)._m0[int(_118)][_120];
    int _124 = int(_116) + 1;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    int _128 = _124 & 3;
    float _130 = (*spvDescriptorSet0.vp_c5)._m0[int(_126)][_128];
    uint _132 = uint(int(uint(_71) >> uint(2)));
    uint _134 = uint(int(uint(int(_132)) >> uint(2)));
    int _136 = int(_132) & 3;
    float _138 = (*spvDescriptorSet0.vp_c5)._m0[int(_134)][_136];
    int _140 = int(_132) + 1;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    int _144 = _140 & 3;
    float _146 = (*spvDescriptorSet0.vp_c5)._m0[int(_142)][_144];
    int _148 = _71 + 16;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    uint _152 = uint(int(uint(int(_150)) >> uint(2)));
    int _154 = int(_150) & 3;
    float _156 = (*spvDescriptorSet0.vp_c5)._m0[int(_152)][_154];
    int _158 = int(_150) + 1;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    int _162 = _158 & 3;
    float _164 = (*spvDescriptorSet0.vp_c5)._m0[int(_160)][_162];
    int _166 = _71 + 32;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    uint _170 = uint(int(uint(int(_168)) >> uint(2)));
    int _172 = int(_168) & 3;
    float _174 = (*spvDescriptorSet0.vp_c5)._m0[int(_170)][_172];
    int _176 = int(_168) + 1;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    int _180 = _176 & 3;
    float _182 = (*spvDescriptorSet0.vp_c5)._m0[int(_178)][_180];
    int _184 = _71 + 24;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    uint _188 = uint(int(uint(int(_186)) >> uint(2)));
    int _190 = int(_186) & 3;
    float _192 = (*spvDescriptorSet0.vp_c5)._m0[int(_188)][_190];
    int _194 = int(_186) + 1;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    int _198 = _194 & 3;
    float _200 = (*spvDescriptorSet0.vp_c5)._m0[int(_196)][_198];
    float _202 = _92 * _88;
    float _204 = fma(_90, _80, _202);
    int _206 = _69 + 24;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    uint _210 = uint(int(uint(int(_208)) >> uint(2)));
    int _212 = int(_208) & 3;
    float _214 = (*spvDescriptorSet0.vp_c5)._m0[int(_210)][_212];
    int _216 = int(_208) + 1;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    int _220 = _216 & 3;
    float _222 = (*spvDescriptorSet0.vp_c5)._m0[int(_218)][_220];
    float _224 = _92 * _112;
    float _226 = fma(_90, _104, _224);
    int _228 = _71 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.vp_c5)._m0[int(_232)][_234];
    int _238 = int(_230) + 1;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    int _242 = _238 & 3;
    float _244 = (*spvDescriptorSet0.vp_c5)._m0[int(_240)][_242];
    float _246 = _92 * _130;
    float _248 = fma(_90, _122, _246);
    int _250 = _69 + 8;
    uint _252 = uint(int(uint(_250) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.vp_c5)._m0[int(_254)][_256];
    int _260 = int(_252) + 1;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    int _264 = _260 & 3;
    float _266 = (*spvDescriptorSet0.vp_c5)._m0[int(_262)][_264];
    float _268 = _92 * _146;
    float _270 = fma(_90, _138, _268);
    int _272 = _71 + 40;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    uint _276 = uint(int(uint(int(_274)) >> uint(2)));
    int _278 = int(_274) & 3;
    float _280 = (*spvDescriptorSet0.vp_c5)._m0[int(_276)][_278];
    int _282 = int(_274) + 1;
    uint _284 = uint(int(uint(_282) >> uint(2)));
    int _286 = _282 & 3;
    float _288 = (*spvDescriptorSet0.vp_c5)._m0[int(_284)][_286];
    float _290 = _92 * _164;
    float _292 = fma(_90, _156, _290);
    int _294 = _69 + 40;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c5)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c5)._m0[int(_306)][_308];
    float _312 = _92 * _182;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _316 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _314;
    float _318 = fma(_90, _174, _312);
    float _320 = fma(_316, _316, _66);
    float _322 = fma(_94, _192, _292);
    float _324 = sqrt(_320);
    float _326 = _322 + _200;
    float _328 = fma(_94, _214, _226);
    float _330 = _326 * _54;
    float _332 = _328 + _222;
    float _334 = fma(_94, _236, _270);
    float _336 = fma(_332, _52, _330);
    float _338 = _334 + _244;
    bool _342 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _344 = isnan(_324);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _350 = _346 || _348;
    float _352 = _336 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _354 = _336 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _356 = fma(_94, _258, _204);
    float _358 = _338 * _54;
    float _360 = _336 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _362 = _356 + _266;
    float _364 = fma(_94, _280, _318);
    float _366 = fma(_362, _52, _358);
    float _368 = _364 + _288;
    float _370 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[3].x, _352);
    float _372 = fma(_94, _302, _248);
    float _374 = _368 * _54;
    float _376 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[4].x, _354);
    float _378 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[5].x, _360);
    float _380 = _372 + _310;
    float _382 = fma(_380, _52, _374);
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[3].z, _370);
    float _386 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[4].z, _376);
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[5].z, _378);
    float _390 = _370;
    if (!_350)
    {
        _390 = 1.0;
    }
    float _392 = _390;
    float _394 = _384 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _396 = _386 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _398 = _388 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _400 = !_350;
    float _402 = _392;
    if (!_400)
    {
        bool _404 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _406 = isnan(_324);
        bool _408 = _404 || _406;
        bool _410 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _412 = _408 || _410;
        if (!_412)
        {
            float _414 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _416 = _324 + _414;
            float _418 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _420 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _418;
            float _422 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _424 = _422 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _426 = 1.0 / _420;
            float _428 = _416 * _426;
            float _430 = fma(_428, _424, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _402 = _430;
            _432 = true;
        }
        else
        {
            bool _434 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _436 = isnan(_324);
            bool _438 = _434 || _436;
            bool _440 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _442 = _438 || _440;
            if (!_442)
            {
                float _444 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _446 = _324 + _444;
                float _448 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _450 = _448 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _452 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _454 = _452 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _456 = 1.0 / _450;
                float _458 = _446 * _456;
                float _460 = fma(_458, _454, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _402 = _460;
                _432 = true;
            }
            else
            {
                _402 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _432 = false;
    float _462 = _402;
    float _464 = _462 + (-1.0);
    float _466 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _468 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _470 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _472 = fma(_396, _462, _466);
    float _474 = fma(_394, _462, _468);
    float _476 = fma(_398, _462, _470);
    float _478 = _472 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _480 = _472 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[2].x, _478);
    float _484 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[0].x, _480);
    float _486 = _472 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _488 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[2].z, _482);
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[0].z, _484);
    float _492 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[1].x, _486);
    float _494 = _488 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _496 = _490 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[1].z, _492);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _502 = _494 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _506 = _496 + _504;
    float _508 = _498 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _510 = _502 * _502;
    float _512 = _508 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _514 = fma(_506, _506, _510);
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c4)._m0[2].x, _512);
    float _518 = sqrt(_514);
    float _520 = fma(_494, (*spvDescriptorSet0.vp_c4)._m0[2].z, _516);
    float _522 = _520 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _524 = _518 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _526 = _476;
    float _528 = _520;
    float _530 = _498;
    float _532 = _522;
    if (!_524)
    {
        _526 = _496;
    }
    float _534 = _526;
    float _536 = _534;
    if (!_524)
    {
        _528 = _494;
    }
    float _538 = _528;
    float _540 = _538;
    if (!_524)
    {
        _530 = _508;
    }
    float _542 = _530;
    bool _544 = !_524;
    float _546 = _542;
    if (!_544)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _550 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _552 = _518 + _550;
        float _554 = _508 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _556 = rsqrt(_514);
        float _558 = _552 * _548;
        float _560 = _558 * 0.15915493667125701904296875;
        float _562 = _560 * 6.283185482025146484375;
        float _564 = cos(_562);
        float _566 = _560 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _564 + (-1.0);
        float _572 = _570 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _574 = fma(_568, _554, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _576 = fma(_508, _564, _572);
        float _578 = _556 * _574;
        float _580 = _576 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _582 = fma(_506, _578, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _584 = fma(_502, _578, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _586 = fma(_582, (*spvDescriptorSet0.vp_c4)._m0[2].x, _580);
        float _588 = fma(_584, (*spvDescriptorSet0.vp_c4)._m0[2].z, _586);
        float _590 = _588 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _546 = _576;
        _536 = _582;
        _540 = _584;
        _532 = _590;
    }
    float _592 = _546;
    float _594 = _536;
    float _596 = _540;
    float _598 = _532;
    float _600 = _592 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _602 = _592 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _604 = fma(_594, (*spvDescriptorSet0.vp_c4)._m0[1].x, _600);
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c4)._m0[0].x, _602);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c4)._m0[1].z, _604);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c4)._m0[0].z, _606);
    float _612 = _608 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _614 = _610 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _616 = _612 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _618 = _612 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _620 = _612 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _622 = _612 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[8].x, _616);
    float _626 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[7].x, _618);
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[9].x, _620);
    float _630 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[10].x, _622);
    float _632 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[8].z, _624);
    float _634 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[7].z, _626);
    float _636 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[9].z, _628);
    float _638 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[10].z, _630);
    float _640 = _632 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _642 = _634 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _644 = _636 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _646 = _638 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _642;
    out.gl_Position.y = _640;
    out.gl_Position.z = _644;
    out.gl_Position.w = _646;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(in.m_29.x);
    float _50 = as_type<float>(in.m_29.y);
    float _52 = in.m_32.x;
    float _54 = in.m_32.y;
    float _56 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _58 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _56;
    float _60 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _62 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _60;
    float _64 = _58 * _58;
    float _66 = fma(_62, _62, _64);
    int _69 = as_type<int>(_48) * 48;
    int _71 = as_type<int>(_50) * 48;
    uint _74 = uint(int(uint(_69) >> uint(2)));
    uint _76 = uint(int(uint(int(_74)) >> uint(2)));
    int _78 = int(_74) & 3;
    float _80 = (*spvDescriptorSet0.vp_c5)._m0[int(_76)][_78];
    int _82 = int(_74) + 1;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    int _86 = _82 & 3;
    float _88 = (*spvDescriptorSet0.vp_c5)._m0[int(_84)][_86];
    float _90 = in.m_34.x;
    float _92 = in.m_34.y;
    float _94 = in.m_34.z;
    int _96 = _69 + 16;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c5)._m0[int(_100)][_102];
    int _106 = int(_98) + 1;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    int _110 = _106 & 3;
    float _112 = (*spvDescriptorSet0.vp_c5)._m0[int(_108)][_110];
    int _114 = _69 + 32;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    uint _118 = uint(int(uint(int(_116)) >> uint(2)));
    int _120 = int(_116) & 3;
    float _122 = (*spvDescriptorSet0.vp_c5)._m0[int(_118)][_120];
    int _124 = int(_116) + 1;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    int _128 = _124 & 3;
    float _130 = (*spvDescriptorSet0.vp_c5)._m0[int(_126)][_128];
    uint _132 = uint(int(uint(_71) >> uint(2)));
    uint _134 = uint(int(uint(int(_132)) >> uint(2)));
    int _136 = int(_132) & 3;
    float _138 = (*spvDescriptorSet0.vp_c5)._m0[int(_134)][_136];
    int _140 = int(_132) + 1;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    int _144 = _140 & 3;
    float _146 = (*spvDescriptorSet0.vp_c5)._m0[int(_142)][_144];
    int _148 = _71 + 16;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    uint _152 = uint(int(uint(int(_150)) >> uint(2)));
    int _154 = int(_150) & 3;
    float _156 = (*spvDescriptorSet0.vp_c5)._m0[int(_152)][_154];
    int _158 = int(_150) + 1;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    int _162 = _158 & 3;
    float _164 = (*spvDescriptorSet0.vp_c5)._m0[int(_160)][_162];
    int _166 = _71 + 32;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    uint _170 = uint(int(uint(int(_168)) >> uint(2)));
    int _172 = int(_168) & 3;
    float _174 = (*spvDescriptorSet0.vp_c5)._m0[int(_170)][_172];
    int _176 = int(_168) + 1;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    int _180 = _176 & 3;
    float _182 = (*spvDescriptorSet0.vp_c5)._m0[int(_178)][_180];
    int _184 = _71 + 24;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    uint _188 = uint(int(uint(int(_186)) >> uint(2)));
    int _190 = int(_186) & 3;
    float _192 = (*spvDescriptorSet0.vp_c5)._m0[int(_188)][_190];
    int _194 = int(_186) + 1;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    int _198 = _194 & 3;
    float _200 = (*spvDescriptorSet0.vp_c5)._m0[int(_196)][_198];
    float _202 = _92 * _88;
    float _204 = fma(_90, _80, _202);
    int _206 = _69 + 24;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    uint _210 = uint(int(uint(int(_208)) >> uint(2)));
    int _212 = int(_208) & 3;
    float _214 = (*spvDescriptorSet0.vp_c5)._m0[int(_210)][_212];
    int _216 = int(_208) + 1;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    int _220 = _216 & 3;
    float _222 = (*spvDescriptorSet0.vp_c5)._m0[int(_218)][_220];
    float _224 = _92 * _112;
    float _226 = fma(_90, _104, _224);
    int _228 = _71 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.vp_c5)._m0[int(_232)][_234];
    int _238 = int(_230) + 1;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    int _242 = _238 & 3;
    float _244 = (*spvDescriptorSet0.vp_c5)._m0[int(_240)][_242];
    float _246 = _92 * _130;
    float _248 = fma(_90, _122, _246);
    int _250 = _69 + 8;
    uint _252 = uint(int(uint(_250) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.vp_c5)._m0[int(_254)][_256];
    int _260 = int(_252) + 1;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    int _264 = _260 & 3;
    float _266 = (*spvDescriptorSet0.vp_c5)._m0[int(_262)][_264];
    float _268 = _92 * _146;
    float _270 = fma(_90, _138, _268);
    int _272 = _71 + 40;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    uint _276 = uint(int(uint(int(_274)) >> uint(2)));
    int _278 = int(_274) & 3;
    float _280 = (*spvDescriptorSet0.vp_c5)._m0[int(_276)][_278];
    int _282 = int(_274) + 1;
    uint _284 = uint(int(uint(_282) >> uint(2)));
    int _286 = _282 & 3;
    float _288 = (*spvDescriptorSet0.vp_c5)._m0[int(_284)][_286];
    float _290 = _92 * _164;
    float _292 = fma(_90, _156, _290);
    int _294 = _69 + 40;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c5)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c5)._m0[int(_306)][_308];
    float _312 = _92 * _182;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _316 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _314;
    float _318 = fma(_90, _174, _312);
    float _320 = fma(_316, _316, _66);
    float _322 = fma(_94, _192, _292);
    float _324 = sqrt(_320);
    float _326 = _322 + _200;
    float _328 = fma(_94, _214, _226);
    float _330 = _326 * _54;
    float _332 = _328 + _222;
    float _334 = fma(_94, _236, _270);
    float _336 = fma(_332, _52, _330);
    float _338 = _334 + _244;
    bool _342 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _344 = isnan(_324);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _350 = _346 || _348;
    float _352 = _336 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _354 = _336 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _356 = fma(_94, _258, _204);
    float _358 = _338 * _54;
    float _360 = _336 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _362 = _356 + _266;
    float _364 = fma(_94, _280, _318);
    float _366 = fma(_362, _52, _358);
    float _368 = _364 + _288;
    float _370 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[3].x, _352);
    float _372 = fma(_94, _302, _248);
    float _374 = _368 * _54;
    float _376 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[4].x, _354);
    float _378 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[5].x, _360);
    float _380 = _372 + _310;
    float _382 = fma(_380, _52, _374);
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[3].z, _370);
    float _386 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[4].z, _376);
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[5].z, _378);
    float _390 = _370;
    if (!_350)
    {
        _390 = 1.0;
    }
    float _392 = _390;
    float _394 = _384 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _396 = _386 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _398 = _388 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _400 = !_350;
    float _402 = _392;
    if (!_400)
    {
        bool _404 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _406 = isnan(_324);
        bool _408 = _404 || _406;
        bool _410 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _412 = _408 || _410;
        if (!_412)
        {
            float _414 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _416 = _324 + _414;
            float _418 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _420 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _418;
            float _422 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _424 = _422 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _426 = 1.0 / _420;
            float _428 = _416 * _426;
            float _430 = fma(_428, _424, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _402 = _430;
            _432 = true;
        }
        else
        {
            bool _434 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _436 = isnan(_324);
            bool _438 = _434 || _436;
            bool _440 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _442 = _438 || _440;
            if (!_442)
            {
                float _444 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _446 = _324 + _444;
                float _448 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _450 = _448 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _452 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _454 = _452 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _456 = 1.0 / _450;
                float _458 = _446 * _456;
                float _460 = fma(_458, _454, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _402 = _460;
                _432 = true;
            }
            else
            {
                _402 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _432 = false;
    float _462 = _402;
    float _464 = _462 + (-1.0);
    float _466 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _468 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _470 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _472 = fma(_396, _462, _466);
    float _474 = fma(_394, _462, _468);
    float _476 = fma(_398, _462, _470);
    float _478 = _472 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _480 = _472 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[2].x, _478);
    float _484 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[0].x, _480);
    float _486 = _472 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _488 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[2].z, _482);
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[0].z, _484);
    float _492 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[1].x, _486);
    float _494 = _488 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _496 = _490 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[1].z, _492);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _502 = _494 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _506 = _496 + _504;
    float _508 = _498 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _510 = _502 * _502;
    float _512 = _508 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _514 = fma(_506, _506, _510);
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c4)._m0[2].x, _512);
    float _518 = sqrt(_514);
    float _520 = fma(_494, (*spvDescriptorSet0.vp_c4)._m0[2].z, _516);
    float _522 = _520 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _524 = _518 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _526 = _476;
    float _528 = _520;
    float _530 = _498;
    float _532 = _522;
    if (!_524)
    {
        _526 = _496;
    }
    float _534 = _526;
    float _536 = _534;
    if (!_524)
    {
        _528 = _494;
    }
    float _538 = _528;
    float _540 = _538;
    if (!_524)
    {
        _530 = _508;
    }
    float _542 = _530;
    bool _544 = !_524;
    float _546 = _542;
    if (!_544)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _550 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _552 = _518 + _550;
        float _554 = _508 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _556 = rsqrt(_514);
        float _558 = _552 * _548;
        float _560 = _558 * 0.15915493667125701904296875;
        float _562 = _560 * 6.283185482025146484375;
        float _564 = cos(_562);
        float _566 = _560 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _564 + (-1.0);
        float _572 = _570 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _574 = fma(_568, _554, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _576 = fma(_508, _564, _572);
        float _578 = _556 * _574;
        float _580 = _576 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _582 = fma(_506, _578, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _584 = fma(_502, _578, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _586 = fma(_582, (*spvDescriptorSet0.vp_c4)._m0[2].x, _580);
        float _588 = fma(_584, (*spvDescriptorSet0.vp_c4)._m0[2].z, _586);
        float _590 = _588 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _546 = _576;
        _536 = _582;
        _540 = _584;
        _532 = _590;
    }
    float _592 = _546;
    float _594 = _536;
    float _596 = _540;
    float _598 = _532;
    float _600 = _592 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _602 = _592 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _604 = fma(_594, (*spvDescriptorSet0.vp_c4)._m0[1].x, _600);
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c4)._m0[0].x, _602);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c4)._m0[1].z, _604);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c4)._m0[0].z, _606);
    float _612 = _608 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _614 = _610 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _616 = _612 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _618 = _612 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _620 = _612 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _622 = _612 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[8].x, _616);
    float _626 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[7].x, _618);
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[9].x, _620);
    float _630 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[10].x, _622);
    float _632 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[8].z, _624);
    float _634 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[7].z, _626);
    float _636 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[9].z, _628);
    float _638 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[10].z, _630);
    float _640 = _632 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _642 = _634 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _644 = _636 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _646 = _638 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _642;
    out.gl_Position.y = _640;
    out.gl_Position.z = _644;
    out.gl_Position.w = _646;
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
    bool _432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(in.m_29.x);
    float _50 = as_type<float>(in.m_29.y);
    float _52 = in.m_32.x;
    float _54 = in.m_32.y;
    float _56 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _58 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _56;
    float _60 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _62 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _60;
    float _64 = _58 * _58;
    float _66 = fma(_62, _62, _64);
    int _69 = as_type<int>(_48) * 48;
    int _71 = as_type<int>(_50) * 48;
    uint _74 = uint(int(uint(_69) >> uint(2)));
    uint _76 = uint(int(uint(int(_74)) >> uint(2)));
    int _78 = int(_74) & 3;
    float _80 = (*spvDescriptorSet0.vp_c5)._m0[int(_76)][_78];
    int _82 = int(_74) + 1;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    int _86 = _82 & 3;
    float _88 = (*spvDescriptorSet0.vp_c5)._m0[int(_84)][_86];
    float _90 = in.m_34.x;
    float _92 = in.m_34.y;
    float _94 = in.m_34.z;
    int _96 = _69 + 16;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c5)._m0[int(_100)][_102];
    int _106 = int(_98) + 1;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    int _110 = _106 & 3;
    float _112 = (*spvDescriptorSet0.vp_c5)._m0[int(_108)][_110];
    int _114 = _69 + 32;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    uint _118 = uint(int(uint(int(_116)) >> uint(2)));
    int _120 = int(_116) & 3;
    float _122 = (*spvDescriptorSet0.vp_c5)._m0[int(_118)][_120];
    int _124 = int(_116) + 1;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    int _128 = _124 & 3;
    float _130 = (*spvDescriptorSet0.vp_c5)._m0[int(_126)][_128];
    uint _132 = uint(int(uint(_71) >> uint(2)));
    uint _134 = uint(int(uint(int(_132)) >> uint(2)));
    int _136 = int(_132) & 3;
    float _138 = (*spvDescriptorSet0.vp_c5)._m0[int(_134)][_136];
    int _140 = int(_132) + 1;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    int _144 = _140 & 3;
    float _146 = (*spvDescriptorSet0.vp_c5)._m0[int(_142)][_144];
    int _148 = _71 + 16;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    uint _152 = uint(int(uint(int(_150)) >> uint(2)));
    int _154 = int(_150) & 3;
    float _156 = (*spvDescriptorSet0.vp_c5)._m0[int(_152)][_154];
    int _158 = int(_150) + 1;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    int _162 = _158 & 3;
    float _164 = (*spvDescriptorSet0.vp_c5)._m0[int(_160)][_162];
    int _166 = _71 + 32;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    uint _170 = uint(int(uint(int(_168)) >> uint(2)));
    int _172 = int(_168) & 3;
    float _174 = (*spvDescriptorSet0.vp_c5)._m0[int(_170)][_172];
    int _176 = int(_168) + 1;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    int _180 = _176 & 3;
    float _182 = (*spvDescriptorSet0.vp_c5)._m0[int(_178)][_180];
    int _184 = _71 + 24;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    uint _188 = uint(int(uint(int(_186)) >> uint(2)));
    int _190 = int(_186) & 3;
    float _192 = (*spvDescriptorSet0.vp_c5)._m0[int(_188)][_190];
    int _194 = int(_186) + 1;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    int _198 = _194 & 3;
    float _200 = (*spvDescriptorSet0.vp_c5)._m0[int(_196)][_198];
    float _202 = _92 * _88;
    float _204 = fma(_90, _80, _202);
    int _206 = _69 + 24;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    uint _210 = uint(int(uint(int(_208)) >> uint(2)));
    int _212 = int(_208) & 3;
    float _214 = (*spvDescriptorSet0.vp_c5)._m0[int(_210)][_212];
    int _216 = int(_208) + 1;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    int _220 = _216 & 3;
    float _222 = (*spvDescriptorSet0.vp_c5)._m0[int(_218)][_220];
    float _224 = _92 * _112;
    float _226 = fma(_90, _104, _224);
    int _228 = _71 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.vp_c5)._m0[int(_232)][_234];
    int _238 = int(_230) + 1;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    int _242 = _238 & 3;
    float _244 = (*spvDescriptorSet0.vp_c5)._m0[int(_240)][_242];
    float _246 = _92 * _130;
    float _248 = fma(_90, _122, _246);
    int _250 = _69 + 8;
    uint _252 = uint(int(uint(_250) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.vp_c5)._m0[int(_254)][_256];
    int _260 = int(_252) + 1;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    int _264 = _260 & 3;
    float _266 = (*spvDescriptorSet0.vp_c5)._m0[int(_262)][_264];
    float _268 = _92 * _146;
    float _270 = fma(_90, _138, _268);
    int _272 = _71 + 40;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    uint _276 = uint(int(uint(int(_274)) >> uint(2)));
    int _278 = int(_274) & 3;
    float _280 = (*spvDescriptorSet0.vp_c5)._m0[int(_276)][_278];
    int _282 = int(_274) + 1;
    uint _284 = uint(int(uint(_282) >> uint(2)));
    int _286 = _282 & 3;
    float _288 = (*spvDescriptorSet0.vp_c5)._m0[int(_284)][_286];
    float _290 = _92 * _164;
    float _292 = fma(_90, _156, _290);
    int _294 = _69 + 40;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c5)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c5)._m0[int(_306)][_308];
    float _312 = _92 * _182;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _316 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _314;
    float _318 = fma(_90, _174, _312);
    float _320 = fma(_316, _316, _66);
    float _322 = fma(_94, _192, _292);
    float _324 = sqrt(_320);
    float _326 = _322 + _200;
    float _328 = fma(_94, _214, _226);
    float _330 = _326 * _54;
    float _332 = _328 + _222;
    float _334 = fma(_94, _236, _270);
    float _336 = fma(_332, _52, _330);
    float _338 = _334 + _244;
    bool _342 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _344 = isnan(_324);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _350 = _346 || _348;
    float _352 = _336 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _354 = _336 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _356 = fma(_94, _258, _204);
    float _358 = _338 * _54;
    float _360 = _336 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _362 = _356 + _266;
    float _364 = fma(_94, _280, _318);
    float _366 = fma(_362, _52, _358);
    float _368 = _364 + _288;
    float _370 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[3].x, _352);
    float _372 = fma(_94, _302, _248);
    float _374 = _368 * _54;
    float _376 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[4].x, _354);
    float _378 = fma(_366, (*spvDescriptorSet0.vp_c6)._m0[5].x, _360);
    float _380 = _372 + _310;
    float _382 = fma(_380, _52, _374);
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[3].z, _370);
    float _386 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[4].z, _376);
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c6)._m0[5].z, _378);
    float _390 = _370;
    if (!_350)
    {
        _390 = 1.0;
    }
    float _392 = _390;
    float _394 = _384 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _396 = _386 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _398 = _388 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _400 = !_350;
    float _402 = _392;
    if (!_400)
    {
        bool _404 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _406 = isnan(_324);
        bool _408 = _404 || _406;
        bool _410 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _412 = _408 || _410;
        if (!_412)
        {
            float _414 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _416 = _324 + _414;
            float _418 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _420 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _418;
            float _422 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _424 = _422 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _426 = 1.0 / _420;
            float _428 = _416 * _426;
            float _430 = fma(_428, _424, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _402 = _430;
            _432 = true;
        }
        else
        {
            bool _434 = _324 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _436 = isnan(_324);
            bool _438 = _434 || _436;
            bool _440 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _442 = _438 || _440;
            if (!_442)
            {
                float _444 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _446 = _324 + _444;
                float _448 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _450 = _448 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _452 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _454 = _452 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _456 = 1.0 / _450;
                float _458 = _446 * _456;
                float _460 = fma(_458, _454, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _402 = _460;
                _432 = true;
            }
            else
            {
                _402 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _432 = false;
    float _462 = _402;
    float _464 = _462 + (-1.0);
    float _466 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _468 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _470 = _464 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _472 = fma(_396, _462, _466);
    float _474 = fma(_394, _462, _468);
    float _476 = fma(_398, _462, _470);
    float _478 = _472 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _480 = _472 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[2].x, _478);
    float _484 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[0].x, _480);
    float _486 = _472 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _488 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[2].z, _482);
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[0].z, _484);
    float _492 = fma(_474, (*spvDescriptorSet0.vp_c6)._m0[1].x, _486);
    float _494 = _488 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _496 = _490 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c6)._m0[1].z, _492);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _502 = _494 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _506 = _496 + _504;
    float _508 = _498 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _510 = _502 * _502;
    float _512 = _508 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _514 = fma(_506, _506, _510);
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c4)._m0[2].x, _512);
    float _518 = sqrt(_514);
    float _520 = fma(_494, (*spvDescriptorSet0.vp_c4)._m0[2].z, _516);
    float _522 = _520 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _524 = _518 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _526 = _476;
    float _528 = _520;
    float _530 = _498;
    float _532 = _522;
    if (!_524)
    {
        _526 = _496;
    }
    float _534 = _526;
    float _536 = _534;
    if (!_524)
    {
        _528 = _494;
    }
    float _538 = _528;
    float _540 = _538;
    if (!_524)
    {
        _530 = _508;
    }
    float _542 = _530;
    bool _544 = !_524;
    float _546 = _542;
    if (!_544)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _550 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _552 = _518 + _550;
        float _554 = _508 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _556 = rsqrt(_514);
        float _558 = _552 * _548;
        float _560 = _558 * 0.15915493667125701904296875;
        float _562 = _560 * 6.283185482025146484375;
        float _564 = cos(_562);
        float _566 = _560 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _564 + (-1.0);
        float _572 = _570 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _574 = fma(_568, _554, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _576 = fma(_508, _564, _572);
        float _578 = _556 * _574;
        float _580 = _576 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _582 = fma(_506, _578, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _584 = fma(_502, _578, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _586 = fma(_582, (*spvDescriptorSet0.vp_c4)._m0[2].x, _580);
        float _588 = fma(_584, (*spvDescriptorSet0.vp_c4)._m0[2].z, _586);
        float _590 = _588 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _546 = _576;
        _536 = _582;
        _540 = _584;
        _532 = _590;
    }
    float _592 = _546;
    float _594 = _536;
    float _596 = _540;
    float _598 = _532;
    float _600 = _592 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _602 = _592 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _604 = fma(_594, (*spvDescriptorSet0.vp_c4)._m0[1].x, _600);
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c4)._m0[0].x, _602);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c4)._m0[1].z, _604);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c4)._m0[0].z, _606);
    float _612 = _608 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _614 = _610 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _616 = _612 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _618 = _612 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _620 = _612 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _622 = _612 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _624 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[8].x, _616);
    float _626 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[7].x, _618);
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[9].x, _620);
    float _630 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[10].x, _622);
    float _632 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[8].z, _624);
    float _634 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[7].z, _626);
    float _636 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[9].z, _628);
    float _638 = fma(_598, (*spvDescriptorSet0.vp_c4)._m0[10].z, _630);
    float _640 = _632 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _642 = _634 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _644 = _636 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _646 = _638 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _642;
    out.gl_Position.y = _640;
    out.gl_Position.z = _644;
    out.gl_Position.w = _646;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


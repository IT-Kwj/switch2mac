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
    constant _16* vp_c11 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    uint4 m_31 [[attribute(6)]];
    float4 m_36 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = as_type<float>(in.m_31.x);
    float _52 = in.m_34.x;
    float _54 = in.m_34.y;
    float _56 = in.m_34.z;
    float _58 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _60 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _58;
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    float _68 = in.m_36.w;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _72 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _70;
    float _74 = _60 * _60;
    float _76 = fma(_72, _72, _74);
    int _79 = as_type<int>(_50) * 48;
    int _81 = _79 + 16;
    uint _84 = uint(int(uint(_81) >> uint(2)));
    uint _86 = uint(int(uint(int(_84)) >> uint(2)));
    int _88 = int(_84) & 3;
    float _90 = (*spvDescriptorSet0.vp_c5)._m0[int(_86)][_88];
    int _92 = int(_84) + 1;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    int _96 = _92 & 3;
    float _98 = (*spvDescriptorSet0.vp_c5)._m0[int(_94)][_96];
    float _100 = _56 + (-0.2599999904632568359375);
    float _102 = _68 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _104 = _100 * _100;
    float _106 = _66 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _108 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _110 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _108;
    uint _112 = uint(int(uint(_79) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.vp_c5)._m0[int(_114)][_116];
    int _120 = int(_112) + 1;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    int _124 = _120 & 3;
    float _126 = (*spvDescriptorSet0.vp_c5)._m0[int(_122)][_124];
    float _128 = fma(_52, _52, _104);
    float _130 = fma(_64, (*spvDescriptorSet0.vp_c11)._m0[21].y, _102);
    float _132 = fma(_110, _110, _76);
    float _134 = fma(_62, (*spvDescriptorSet0.vp_c11)._m0[21].x, _106);
    float _136 = _130 + _54;
    float _138 = rsqrt(_128);
    int _140 = _79 + 32;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    uint _144 = uint(int(uint(int(_142)) >> uint(2)));
    int _146 = int(_142) & 3;
    float _148 = (*spvDescriptorSet0.vp_c5)._m0[int(_144)][_146];
    int _150 = int(_142) + 1;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    int _154 = _150 & 3;
    float _156 = (*spvDescriptorSet0.vp_c5)._m0[int(_152)][_154];
    float _158 = sqrt(_132);
    int _160 = _79 + 24;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    float _178 = _138 * _52;
    int _180 = _79 + 8;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    uint _184 = uint(int(uint(int(_182)) >> uint(2)));
    int _186 = int(_182) & 3;
    float _188 = (*spvDescriptorSet0.vp_c5)._m0[int(_184)][_186];
    int _190 = int(_182) + 1;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    int _194 = _190 & 3;
    float _196 = (*spvDescriptorSet0.vp_c5)._m0[int(_192)][_194];
    float _198 = _100 * _138;
    float _200 = fma(_178, _134, _52);
    float _202 = fma(_198, _106, _56);
    bool _206 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _208 = isnan(_158);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _214 = _210 || _212;
    int _216 = _79 + 40;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    uint _220 = uint(int(uint(int(_218)) >> uint(2)));
    int _222 = int(_218) & 3;
    float _224 = (*spvDescriptorSet0.vp_c5)._m0[int(_220)][_222];
    int _226 = int(_218) + 1;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    int _230 = _226 & 3;
    float _232 = (*spvDescriptorSet0.vp_c5)._m0[int(_228)][_230];
    float _234 = _136 * _98;
    float _236 = fma(_200, _90, _234);
    float _238 = _136 * _126;
    float _240 = fma(_200, _118, _238);
    float _242 = _136 * _156;
    float _244 = fma(_200, _148, _242);
    float _246 = fma(_202, _168, _236);
    float _248 = _246 + _176;
    float _250 = fma(_202, _188, _240);
    float _252 = _248 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _254 = _248 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _256 = _250 + _196;
    float _258 = fma(_202, _224, _244);
    float _260 = _248 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _262 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[3].x, _252);
    float _264 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[5].x, _254);
    float _266 = _258 + _232;
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[4].x, _260);
    float _270 = _248;
    if (!_214)
    {
        _270 = 1.0;
    }
    float _272 = _270;
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[3].z, _262);
    float _276 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[4].z, _268);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[5].z, _264);
    float _280 = _274 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _286 = !_214;
    float _288 = _272;
    if (!_286)
    {
        bool _290 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _292 = isnan(_158);
        bool _294 = _290 || _292;
        bool _296 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _298 = _294 || _296;
        if (!_298)
        {
            float _300 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _302 = _158 + _300;
            float _304 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _306 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _304;
            float _308 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _310 = _308 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _312 = 1.0 / _306;
            float _314 = _302 * _312;
            float _316 = fma(_314, _310, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _288 = _316;
            _318 = true;
        }
        else
        {
            bool _320 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _322 = isnan(_158);
            bool _324 = _320 || _322;
            bool _326 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _328 = _324 || _326;
            if (!_328)
            {
                float _330 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _332 = _158 + _330;
                float _334 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _336 = _334 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _338 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _340 = _338 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _342 = 1.0 / _336;
                float _344 = _332 * _342;
                float _346 = fma(_344, _340, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _288 = _346;
                _318 = true;
            }
            else
            {
                _288 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _318 = false;
    float _348 = _288;
    float _350 = _348 + (-1.0);
    float _352 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _354 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _356 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _358 = fma(_282, _348, _352);
    float _360 = fma(_280, _348, _354);
    float _362 = fma(_284, _348, _356);
    float _364 = _358 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _366 = _358 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[2].x, _364);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[0].x, _366);
    float _372 = _358 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[2].z, _368);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[0].z, _370);
    float _378 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[1].x, _372);
    float _380 = _374 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _382 = _376 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[1].z, _378);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _388 = _380 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _392 = _382 + _390;
    float _394 = _384 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _396 = _388 * _388;
    float _398 = _394 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _400 = fma(_392, _392, _396);
    float _402 = fma(_382, (*spvDescriptorSet0.vp_c4)._m0[2].x, _398);
    float _404 = sqrt(_400);
    float _406 = fma(_380, (*spvDescriptorSet0.vp_c4)._m0[2].z, _402);
    float _408 = _406 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _410 = _404 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _412 = _362;
    float _414 = _406;
    float _416 = _384;
    float _418 = _408;
    if (!_410)
    {
        _412 = _382;
    }
    float _420 = _412;
    float _422 = _420;
    if (!_410)
    {
        _414 = _380;
    }
    float _424 = _414;
    float _426 = _424;
    if (!_410)
    {
        _416 = _394;
    }
    float _428 = _416;
    bool _430 = !_410;
    float _432 = _428;
    if (!_430)
    {
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _438 = _404 + _436;
        float _440 = _394 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _442 = rsqrt(_400);
        float _444 = _438 * _434;
        float _446 = _444 * 0.15915493667125701904296875;
        float _448 = _446 * 6.283185482025146484375;
        float _450 = cos(_448);
        float _452 = _446 * 6.283185482025146484375;
        float _454 = sin(_452);
        float _456 = _450 + (-1.0);
        float _458 = _456 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _460 = fma(_454, _440, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _462 = fma(_394, _450, _458);
        float _464 = _442 * _460;
        float _466 = _462 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _468 = fma(_392, _464, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _470 = fma(_388, _464, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _472 = fma(_468, (*spvDescriptorSet0.vp_c4)._m0[2].x, _466);
        float _474 = fma(_470, (*spvDescriptorSet0.vp_c4)._m0[2].z, _472);
        float _476 = _474 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _432 = _462;
        _422 = _468;
        _426 = _470;
        _418 = _476;
    }
    float _478 = _432;
    float _480 = _422;
    float _482 = _426;
    float _484 = _418;
    float _486 = _478 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _488 = _478 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c4)._m0[1].x, _486);
    float _492 = fma(_480, (*spvDescriptorSet0.vp_c4)._m0[0].x, _488);
    float _494 = fma(_482, (*spvDescriptorSet0.vp_c4)._m0[1].z, _490);
    float _496 = fma(_482, (*spvDescriptorSet0.vp_c4)._m0[0].z, _492);
    float _498 = _494 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _500 = _496 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _502 = _498 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _504 = _498 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _506 = _498 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _508 = _498 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[8].x, _502);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[7].x, _504);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[9].x, _506);
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[10].x, _508);
    float _518 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[8].z, _510);
    float _520 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[7].z, _512);
    float _522 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[9].z, _514);
    float _524 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[10].z, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _528 = _520 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _530 = _522 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _532 = _524 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _528;
    out.gl_Position.y = _526;
    out.gl_Position.z = _530;
    out.gl_Position.w = _532;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = as_type<float>(in.m_31.x);
    float _52 = in.m_34.x;
    float _54 = in.m_34.y;
    float _56 = in.m_34.z;
    float _58 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _60 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _58;
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    float _68 = in.m_36.w;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _72 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _70;
    float _74 = _60 * _60;
    float _76 = fma(_72, _72, _74);
    int _79 = as_type<int>(_50) * 48;
    int _81 = _79 + 16;
    uint _84 = uint(int(uint(_81) >> uint(2)));
    uint _86 = uint(int(uint(int(_84)) >> uint(2)));
    int _88 = int(_84) & 3;
    float _90 = (*spvDescriptorSet0.vp_c5)._m0[int(_86)][_88];
    int _92 = int(_84) + 1;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    int _96 = _92 & 3;
    float _98 = (*spvDescriptorSet0.vp_c5)._m0[int(_94)][_96];
    float _100 = _56 + (-0.2599999904632568359375);
    float _102 = _68 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _104 = _100 * _100;
    float _106 = _66 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _108 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _110 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _108;
    uint _112 = uint(int(uint(_79) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.vp_c5)._m0[int(_114)][_116];
    int _120 = int(_112) + 1;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    int _124 = _120 & 3;
    float _126 = (*spvDescriptorSet0.vp_c5)._m0[int(_122)][_124];
    float _128 = fma(_52, _52, _104);
    float _130 = fma(_64, (*spvDescriptorSet0.vp_c11)._m0[21].y, _102);
    float _132 = fma(_110, _110, _76);
    float _134 = fma(_62, (*spvDescriptorSet0.vp_c11)._m0[21].x, _106);
    float _136 = _130 + _54;
    float _138 = rsqrt(_128);
    int _140 = _79 + 32;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    uint _144 = uint(int(uint(int(_142)) >> uint(2)));
    int _146 = int(_142) & 3;
    float _148 = (*spvDescriptorSet0.vp_c5)._m0[int(_144)][_146];
    int _150 = int(_142) + 1;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    int _154 = _150 & 3;
    float _156 = (*spvDescriptorSet0.vp_c5)._m0[int(_152)][_154];
    float _158 = sqrt(_132);
    int _160 = _79 + 24;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    float _178 = _138 * _52;
    int _180 = _79 + 8;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    uint _184 = uint(int(uint(int(_182)) >> uint(2)));
    int _186 = int(_182) & 3;
    float _188 = (*spvDescriptorSet0.vp_c5)._m0[int(_184)][_186];
    int _190 = int(_182) + 1;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    int _194 = _190 & 3;
    float _196 = (*spvDescriptorSet0.vp_c5)._m0[int(_192)][_194];
    float _198 = _100 * _138;
    float _200 = fma(_178, _134, _52);
    float _202 = fma(_198, _106, _56);
    bool _206 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _208 = isnan(_158);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _214 = _210 || _212;
    int _216 = _79 + 40;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    uint _220 = uint(int(uint(int(_218)) >> uint(2)));
    int _222 = int(_218) & 3;
    float _224 = (*spvDescriptorSet0.vp_c5)._m0[int(_220)][_222];
    int _226 = int(_218) + 1;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    int _230 = _226 & 3;
    float _232 = (*spvDescriptorSet0.vp_c5)._m0[int(_228)][_230];
    float _234 = _136 * _98;
    float _236 = fma(_200, _90, _234);
    float _238 = _136 * _126;
    float _240 = fma(_200, _118, _238);
    float _242 = _136 * _156;
    float _244 = fma(_200, _148, _242);
    float _246 = fma(_202, _168, _236);
    float _248 = _246 + _176;
    float _250 = fma(_202, _188, _240);
    float _252 = _248 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _254 = _248 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _256 = _250 + _196;
    float _258 = fma(_202, _224, _244);
    float _260 = _248 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _262 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[3].x, _252);
    float _264 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[5].x, _254);
    float _266 = _258 + _232;
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[4].x, _260);
    float _270 = _248;
    if (!_214)
    {
        _270 = 1.0;
    }
    float _272 = _270;
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[3].z, _262);
    float _276 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[4].z, _268);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[5].z, _264);
    float _280 = _274 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _286 = !_214;
    float _288 = _272;
    if (!_286)
    {
        bool _290 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _292 = isnan(_158);
        bool _294 = _290 || _292;
        bool _296 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _298 = _294 || _296;
        if (!_298)
        {
            float _300 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _302 = _158 + _300;
            float _304 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _306 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _304;
            float _308 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _310 = _308 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _312 = 1.0 / _306;
            float _314 = _302 * _312;
            float _316 = fma(_314, _310, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _288 = _316;
            _318 = true;
        }
        else
        {
            bool _320 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _322 = isnan(_158);
            bool _324 = _320 || _322;
            bool _326 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _328 = _324 || _326;
            if (!_328)
            {
                float _330 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _332 = _158 + _330;
                float _334 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _336 = _334 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _338 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _340 = _338 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _342 = 1.0 / _336;
                float _344 = _332 * _342;
                float _346 = fma(_344, _340, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _288 = _346;
                _318 = true;
            }
            else
            {
                _288 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _318 = false;
    float _348 = _288;
    float _350 = _348 + (-1.0);
    float _352 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _354 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _356 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _358 = fma(_282, _348, _352);
    float _360 = fma(_280, _348, _354);
    float _362 = fma(_284, _348, _356);
    float _364 = _358 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _366 = _358 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[2].x, _364);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[0].x, _366);
    float _372 = _358 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[2].z, _368);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[0].z, _370);
    float _378 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[1].x, _372);
    float _380 = _374 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _382 = _376 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[1].z, _378);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _388 = _380 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _392 = _382 + _390;
    float _394 = _384 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _396 = _388 * _388;
    float _398 = _394 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _400 = fma(_392, _392, _396);
    float _402 = fma(_382, (*spvDescriptorSet0.vp_c4)._m0[2].x, _398);
    float _404 = sqrt(_400);
    float _406 = fma(_380, (*spvDescriptorSet0.vp_c4)._m0[2].z, _402);
    float _408 = _406 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _410 = _404 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _412 = _362;
    float _414 = _406;
    float _416 = _384;
    float _418 = _408;
    if (!_410)
    {
        _412 = _382;
    }
    float _420 = _412;
    float _422 = _420;
    if (!_410)
    {
        _414 = _380;
    }
    float _424 = _414;
    float _426 = _424;
    if (!_410)
    {
        _416 = _394;
    }
    float _428 = _416;
    bool _430 = !_410;
    float _432 = _428;
    if (!_430)
    {
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _438 = _404 + _436;
        float _440 = _394 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _442 = rsqrt(_400);
        float _444 = _438 * _434;
        float _446 = _444 * 0.15915493667125701904296875;
        float _448 = _446 * 6.283185482025146484375;
        float _450 = cos(_448);
        float _452 = _446 * 6.283185482025146484375;
        float _454 = sin(_452);
        float _456 = _450 + (-1.0);
        float _458 = _456 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _460 = fma(_454, _440, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _462 = fma(_394, _450, _458);
        float _464 = _442 * _460;
        float _466 = _462 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _468 = fma(_392, _464, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _470 = fma(_388, _464, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _472 = fma(_468, (*spvDescriptorSet0.vp_c4)._m0[2].x, _466);
        float _474 = fma(_470, (*spvDescriptorSet0.vp_c4)._m0[2].z, _472);
        float _476 = _474 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _432 = _462;
        _422 = _468;
        _426 = _470;
        _418 = _476;
    }
    float _478 = _432;
    float _480 = _422;
    float _482 = _426;
    float _484 = _418;
    float _486 = _478 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _488 = _478 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c4)._m0[1].x, _486);
    float _492 = fma(_480, (*spvDescriptorSet0.vp_c4)._m0[0].x, _488);
    float _494 = fma(_482, (*spvDescriptorSet0.vp_c4)._m0[1].z, _490);
    float _496 = fma(_482, (*spvDescriptorSet0.vp_c4)._m0[0].z, _492);
    float _498 = _494 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _500 = _496 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _502 = _498 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _504 = _498 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _506 = _498 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _508 = _498 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[8].x, _502);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[7].x, _504);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[9].x, _506);
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[10].x, _508);
    float _518 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[8].z, _510);
    float _520 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[7].z, _512);
    float _522 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[9].z, _514);
    float _524 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[10].z, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _528 = _520 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _530 = _522 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _532 = _524 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _528;
    out.gl_Position.y = _526;
    out.gl_Position.z = _530;
    out.gl_Position.w = _532;
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
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = as_type<float>(in.m_31.x);
    float _52 = in.m_34.x;
    float _54 = in.m_34.y;
    float _56 = in.m_34.z;
    float _58 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _60 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _58;
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    float _68 = in.m_36.w;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _72 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _70;
    float _74 = _60 * _60;
    float _76 = fma(_72, _72, _74);
    int _79 = as_type<int>(_50) * 48;
    int _81 = _79 + 16;
    uint _84 = uint(int(uint(_81) >> uint(2)));
    uint _86 = uint(int(uint(int(_84)) >> uint(2)));
    int _88 = int(_84) & 3;
    float _90 = (*spvDescriptorSet0.vp_c5)._m0[int(_86)][_88];
    int _92 = int(_84) + 1;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    int _96 = _92 & 3;
    float _98 = (*spvDescriptorSet0.vp_c5)._m0[int(_94)][_96];
    float _100 = _56 + (-0.2599999904632568359375);
    float _102 = _68 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _104 = _100 * _100;
    float _106 = _66 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _108 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _110 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _108;
    uint _112 = uint(int(uint(_79) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.vp_c5)._m0[int(_114)][_116];
    int _120 = int(_112) + 1;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    int _124 = _120 & 3;
    float _126 = (*spvDescriptorSet0.vp_c5)._m0[int(_122)][_124];
    float _128 = fma(_52, _52, _104);
    float _130 = fma(_64, (*spvDescriptorSet0.vp_c11)._m0[21].y, _102);
    float _132 = fma(_110, _110, _76);
    float _134 = fma(_62, (*spvDescriptorSet0.vp_c11)._m0[21].x, _106);
    float _136 = _130 + _54;
    float _138 = rsqrt(_128);
    int _140 = _79 + 32;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    uint _144 = uint(int(uint(int(_142)) >> uint(2)));
    int _146 = int(_142) & 3;
    float _148 = (*spvDescriptorSet0.vp_c5)._m0[int(_144)][_146];
    int _150 = int(_142) + 1;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    int _154 = _150 & 3;
    float _156 = (*spvDescriptorSet0.vp_c5)._m0[int(_152)][_154];
    float _158 = sqrt(_132);
    int _160 = _79 + 24;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    float _178 = _138 * _52;
    int _180 = _79 + 8;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    uint _184 = uint(int(uint(int(_182)) >> uint(2)));
    int _186 = int(_182) & 3;
    float _188 = (*spvDescriptorSet0.vp_c5)._m0[int(_184)][_186];
    int _190 = int(_182) + 1;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    int _194 = _190 & 3;
    float _196 = (*spvDescriptorSet0.vp_c5)._m0[int(_192)][_194];
    float _198 = _100 * _138;
    float _200 = fma(_178, _134, _52);
    float _202 = fma(_198, _106, _56);
    bool _206 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _208 = isnan(_158);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _214 = _210 || _212;
    int _216 = _79 + 40;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    uint _220 = uint(int(uint(int(_218)) >> uint(2)));
    int _222 = int(_218) & 3;
    float _224 = (*spvDescriptorSet0.vp_c5)._m0[int(_220)][_222];
    int _226 = int(_218) + 1;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    int _230 = _226 & 3;
    float _232 = (*spvDescriptorSet0.vp_c5)._m0[int(_228)][_230];
    float _234 = _136 * _98;
    float _236 = fma(_200, _90, _234);
    float _238 = _136 * _126;
    float _240 = fma(_200, _118, _238);
    float _242 = _136 * _156;
    float _244 = fma(_200, _148, _242);
    float _246 = fma(_202, _168, _236);
    float _248 = _246 + _176;
    float _250 = fma(_202, _188, _240);
    float _252 = _248 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _254 = _248 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _256 = _250 + _196;
    float _258 = fma(_202, _224, _244);
    float _260 = _248 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _262 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[3].x, _252);
    float _264 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[5].x, _254);
    float _266 = _258 + _232;
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c6)._m0[4].x, _260);
    float _270 = _248;
    if (!_214)
    {
        _270 = 1.0;
    }
    float _272 = _270;
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[3].z, _262);
    float _276 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[4].z, _268);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c6)._m0[5].z, _264);
    float _280 = _274 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _286 = !_214;
    float _288 = _272;
    if (!_286)
    {
        bool _290 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _292 = isnan(_158);
        bool _294 = _290 || _292;
        bool _296 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _298 = _294 || _296;
        if (!_298)
        {
            float _300 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _302 = _158 + _300;
            float _304 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _306 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _304;
            float _308 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _310 = _308 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _312 = 1.0 / _306;
            float _314 = _302 * _312;
            float _316 = fma(_314, _310, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _288 = _316;
            _318 = true;
        }
        else
        {
            bool _320 = _158 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _322 = isnan(_158);
            bool _324 = _320 || _322;
            bool _326 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _328 = _324 || _326;
            if (!_328)
            {
                float _330 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _332 = _158 + _330;
                float _334 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _336 = _334 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _338 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _340 = _338 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _342 = 1.0 / _336;
                float _344 = _332 * _342;
                float _346 = fma(_344, _340, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _288 = _346;
                _318 = true;
            }
            else
            {
                _288 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _318 = false;
    float _348 = _288;
    float _350 = _348 + (-1.0);
    float _352 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _354 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _356 = _350 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _358 = fma(_282, _348, _352);
    float _360 = fma(_280, _348, _354);
    float _362 = fma(_284, _348, _356);
    float _364 = _358 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _366 = _358 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[2].x, _364);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[0].x, _366);
    float _372 = _358 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[2].z, _368);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[0].z, _370);
    float _378 = fma(_360, (*spvDescriptorSet0.vp_c6)._m0[1].x, _372);
    float _380 = _374 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _382 = _376 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c6)._m0[1].z, _378);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _388 = _380 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _392 = _382 + _390;
    float _394 = _384 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _396 = _388 * _388;
    float _398 = _394 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _400 = fma(_392, _392, _396);
    float _402 = fma(_382, (*spvDescriptorSet0.vp_c4)._m0[2].x, _398);
    float _404 = sqrt(_400);
    float _406 = fma(_380, (*spvDescriptorSet0.vp_c4)._m0[2].z, _402);
    float _408 = _406 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _410 = _404 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _412 = _362;
    float _414 = _406;
    float _416 = _384;
    float _418 = _408;
    if (!_410)
    {
        _412 = _382;
    }
    float _420 = _412;
    float _422 = _420;
    if (!_410)
    {
        _414 = _380;
    }
    float _424 = _414;
    float _426 = _424;
    if (!_410)
    {
        _416 = _394;
    }
    float _428 = _416;
    bool _430 = !_410;
    float _432 = _428;
    if (!_430)
    {
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _438 = _404 + _436;
        float _440 = _394 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _442 = rsqrt(_400);
        float _444 = _438 * _434;
        float _446 = _444 * 0.15915493667125701904296875;
        float _448 = _446 * 6.283185482025146484375;
        float _450 = cos(_448);
        float _452 = _446 * 6.283185482025146484375;
        float _454 = sin(_452);
        float _456 = _450 + (-1.0);
        float _458 = _456 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _460 = fma(_454, _440, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _462 = fma(_394, _450, _458);
        float _464 = _442 * _460;
        float _466 = _462 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _468 = fma(_392, _464, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _470 = fma(_388, _464, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _472 = fma(_468, (*spvDescriptorSet0.vp_c4)._m0[2].x, _466);
        float _474 = fma(_470, (*spvDescriptorSet0.vp_c4)._m0[2].z, _472);
        float _476 = _474 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _432 = _462;
        _422 = _468;
        _426 = _470;
        _418 = _476;
    }
    float _478 = _432;
    float _480 = _422;
    float _482 = _426;
    float _484 = _418;
    float _486 = _478 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _488 = _478 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c4)._m0[1].x, _486);
    float _492 = fma(_480, (*spvDescriptorSet0.vp_c4)._m0[0].x, _488);
    float _494 = fma(_482, (*spvDescriptorSet0.vp_c4)._m0[1].z, _490);
    float _496 = fma(_482, (*spvDescriptorSet0.vp_c4)._m0[0].z, _492);
    float _498 = _494 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _500 = _496 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _502 = _498 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _504 = _498 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _506 = _498 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _508 = _498 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[8].x, _502);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[7].x, _504);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[9].x, _506);
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c4)._m0[10].x, _508);
    float _518 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[8].z, _510);
    float _520 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[7].z, _512);
    float _522 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[9].z, _514);
    float _524 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[10].z, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _528 = _520 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _530 = _522 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _532 = _524 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _528;
    out.gl_Position.y = _526;
    out.gl_Position.z = _530;
    out.gl_Position.w = _532;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_45 [[attribute(9)]];
    float4 m_41 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    float _80 = as_type<float>(_72);
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _78;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _543 = as_type<float>(_88);
        out.gl_Position.z = _543;
    }
    if (!_76)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _80 = _108;
    }
    float _110 = _80;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_33.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _612 = as_type<float>(_124);
        out.gl_Position.z = _612;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_37.x;
    float _128 = in.m_37.y;
    float _130 = in.m_37.z;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _134 = in.m_39.x;
    float _136 = in.m_39.y;
    float _138 = in.m_39.z;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_41.w;
    float _146 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _150 = _148 != 0;
    float _152 = in.m_43.x;
    float _154 = in.m_43.y;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _158 = in.m_45.y;
    float _160 = in.m_45.x;
    float _162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _126);
    float _164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _128);
    float _166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _130);
    float _168 = in.m_30.x;
    float _170 = in.m_30.y;
    float _172 = in.m_30.z;
    float _174 = _136 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _176 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    out.m_47.w = _144;
    float _178 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _180 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _184 = _154 > 0.5;
    float _186 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _146);
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _190 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _192 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _194 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _182);
    float _196 = _154;
    float _198 = _158;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_142)
    {
        float _202 = in.m_43.x;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _208 = fma(_192, -2.0, _156);
    float _210 = _178 * _164;
    float _212 = -_188;
    float _214 = fma(_190, 2.0, _212);
    float _216 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _218 = _206 * _162;
    float _220 = _210 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _222 = _210 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _224 = _216 * _166;
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _228 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[10].x, _220);
    float _232 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[8].x, _222);
    float _234 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _226);
    float _236 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _228);
    float _238 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].z, _230);
    float _240 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[8].z, _232);
    float _242 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    float _244 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _236);
    float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _248 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = _242 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _252 = _244 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _254 = _204 > 0.5;
    bool _256 = _254 && _142;
    float _258 = -_158;
    float _260 = _258 + 1.0;
    float _262 = _250 + _238;
    float _264 = _252 + _240;
    float _266 = _210 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _274 = _264 + _272;
    float _276 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[9].x, _266);
    float _278 = _270 * _270;
    float _280 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _208);
    float _282 = _168;
    float _284 = _172;
    if (_150)
    {
        float _286 = _184 ? _260 : _158;
        _198 = _286;
    }
    float _288 = _198;
    float _290 = fma(_274, _274, _278);
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _298 = sqrt(_290);
    float _300 = _246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _304 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    if (_142)
    {
        _200 = _160;
    }
    float _306 = _200;
    float _308 = _292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _312 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _314 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _316 = _306;
    if (_256)
    {
        float _318 = -_306;
        float _320 = _318 + 1.0;
        _316 = _320;
    }
    float _322 = _316;
    float _324 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[9].z, _276);
    float _326 = _312 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_142)
    {
        _282 = _160;
    }
    float _328 = _282;
    float _330 = fma(_300, _288, -0.5);
    float _332 = _328;
    if (_142)
    {
        _332 = _322;
    }
    float _334 = _332;
    out.m_49.x = _308;
    out.m_49.y = _310;
    out.m_49.z = _314;
    out.m_49.w = _302;
    bool _336 = _298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _338 = _132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _340 = _326 + _324;
    float _342 = -_106;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _214);
    float _346 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _186);
    float _348 = fma(_338, _334, -0.5);
    float _350 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _194);
    float _352 = _334;
    float _354 = _338;
    if (!_336)
    {
        _284 = _264;
    }
    float _356 = _284;
    float _358 = -_280;
    float _360 = fma(_346, _330, _358);
    float _362 = _356;
    if (!_336)
    {
        _352 = _262;
    }
    float _364 = _352;
    float _366 = _364;
    if (!_336)
    {
        _354 = _340;
    }
    float _368 = _354;
    bool _370 = !_336;
    float _372 = _368;
    if (!_370)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _378 = _298 + _376;
        float _380 = _340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = rsqrt(_290);
        float _384 = _378 * _374;
        float _386 = _384 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = cos(_388);
        float _392 = _386 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 + (-1.0);
        float _398 = _396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = fma(_394, _380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = fma(_340, _390, _398);
        float _404 = _382 * _400;
        float _406 = fma(_274, _404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_270, _404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _372 = _402;
        _362 = _406;
        _366 = _408;
    }
    float _410 = _372;
    float _412 = _362;
    float _414 = _366;
    float _416 = _410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _418 = _410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _422 = _410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[0].x, _418);
    float _428 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[2].x, _420);
    float _430 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[3].x, _422);
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _424);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _426);
    float _436 = fma(_350, _348, _344);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _428);
    float _440 = _432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _442 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _430);
    float _444 = _434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _446 = _438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _448 = _440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _450 = _440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _452 = _440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _454 = _440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _448);
    float _458 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _450);
    float _460 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _452);
    float _462 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _454);
    float _464 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _456);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _458);
    float _468 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _460);
    float _470 = _442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _472 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _462);
    float _474 = _360 + 0.5;
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _466);
    float _478 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _480 = _436 + 0.5;
    float _482 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _464);
    float _484 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _468);
    float _486 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _472);
    out.m_51.w = _478;
    out.m_53.x = _480;
    out.m_53.y = _474;
    out.m_33.x = 1.0;
    out.gl_Position.x = _476;
    out.gl_Position.y = _482;
    out.gl_Position.z = _484;
    out.gl_Position.w = _486;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    float _80 = as_type<float>(_72);
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _78;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _543 = as_type<float>(_88);
        out.gl_Position.z = _543;
    }
    if (!_76)
    {
        return out;
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _80 = _108;
    }
    float _110 = _80;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_33.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _612 = as_type<float>(_124);
        out.gl_Position.z = _612;
    }
    if (_116)
    {
        return out;
    }
    float _126 = in.m_37.x;
    float _128 = in.m_37.y;
    float _130 = in.m_37.z;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _134 = in.m_39.x;
    float _136 = in.m_39.y;
    float _138 = in.m_39.z;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_41.w;
    float _146 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _150 = _148 != 0;
    float _152 = in.m_43.x;
    float _154 = in.m_43.y;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _158 = in.m_45.y;
    float _160 = in.m_45.x;
    float _162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _126);
    float _164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _128);
    float _166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _130);
    float _168 = in.m_30.x;
    float _170 = in.m_30.y;
    float _172 = in.m_30.z;
    float _174 = _136 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _176 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    out.m_47.w = _144;
    float _178 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _180 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _184 = _154 > 0.5;
    float _186 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _146);
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _190 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _192 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _194 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _182);
    float _196 = _154;
    float _198 = _158;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_142)
    {
        float _202 = in.m_43.x;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _208 = fma(_192, -2.0, _156);
    float _210 = _178 * _164;
    float _212 = -_188;
    float _214 = fma(_190, 2.0, _212);
    float _216 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _218 = _206 * _162;
    float _220 = _210 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _222 = _210 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _224 = _216 * _166;
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _228 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[10].x, _220);
    float _232 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[8].x, _222);
    float _234 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _226);
    float _236 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _228);
    float _238 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].z, _230);
    float _240 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[8].z, _232);
    float _242 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    float _244 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _236);
    float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _248 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = _242 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _252 = _244 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _254 = _204 > 0.5;
    bool _256 = _254 && _142;
    float _258 = -_158;
    float _260 = _258 + 1.0;
    float _262 = _250 + _238;
    float _264 = _252 + _240;
    float _266 = _210 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _274 = _264 + _272;
    float _276 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[9].x, _266);
    float _278 = _270 * _270;
    float _280 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _208);
    float _282 = _168;
    float _284 = _172;
    if (_150)
    {
        float _286 = _184 ? _260 : _158;
        _198 = _286;
    }
    float _288 = _198;
    float _290 = fma(_274, _274, _278);
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _298 = sqrt(_290);
    float _300 = _246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _304 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    if (_142)
    {
        _200 = _160;
    }
    float _306 = _200;
    float _308 = _292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _312 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _314 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _316 = _306;
    if (_256)
    {
        float _318 = -_306;
        float _320 = _318 + 1.0;
        _316 = _320;
    }
    float _322 = _316;
    float _324 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[9].z, _276);
    float _326 = _312 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_142)
    {
        _282 = _160;
    }
    float _328 = _282;
    float _330 = fma(_300, _288, -0.5);
    float _332 = _328;
    if (_142)
    {
        _332 = _322;
    }
    float _334 = _332;
    out.m_49.x = _308;
    out.m_49.y = _310;
    out.m_49.z = _314;
    out.m_49.w = _302;
    bool _336 = _298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _338 = _132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _340 = _326 + _324;
    float _342 = -_106;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _214);
    float _346 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _186);
    float _348 = fma(_338, _334, -0.5);
    float _350 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _194);
    float _352 = _334;
    float _354 = _338;
    if (!_336)
    {
        _284 = _264;
    }
    float _356 = _284;
    float _358 = -_280;
    float _360 = fma(_346, _330, _358);
    float _362 = _356;
    if (!_336)
    {
        _352 = _262;
    }
    float _364 = _352;
    float _366 = _364;
    if (!_336)
    {
        _354 = _340;
    }
    float _368 = _354;
    bool _370 = !_336;
    float _372 = _368;
    if (!_370)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _378 = _298 + _376;
        float _380 = _340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = rsqrt(_290);
        float _384 = _378 * _374;
        float _386 = _384 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = cos(_388);
        float _392 = _386 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 + (-1.0);
        float _398 = _396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = fma(_394, _380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = fma(_340, _390, _398);
        float _404 = _382 * _400;
        float _406 = fma(_274, _404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_270, _404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _372 = _402;
        _362 = _406;
        _366 = _408;
    }
    float _410 = _372;
    float _412 = _362;
    float _414 = _366;
    float _416 = _410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _418 = _410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _422 = _410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[0].x, _418);
    float _428 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[2].x, _420);
    float _430 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[3].x, _422);
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _424);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _426);
    float _436 = fma(_350, _348, _344);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _428);
    float _440 = _432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _442 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _430);
    float _444 = _434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _446 = _438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _448 = _440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _450 = _440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _452 = _440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _454 = _440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _448);
    float _458 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _450);
    float _460 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _452);
    float _462 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _454);
    float _464 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _456);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _458);
    float _468 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _460);
    float _470 = _442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _472 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _462);
    float _474 = _360 + 0.5;
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _466);
    float _478 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _480 = _436 + 0.5;
    float _482 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _464);
    float _484 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _468);
    float _486 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _472);
    out.m_51.w = _478;
    out.m_53.x = _480;
    out.m_53.y = _474;
    out.m_33.x = 1.0;
    out.gl_Position.x = _476;
    out.gl_Position.y = _482;
    out.gl_Position.z = _484;
    out.gl_Position.w = _486;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    float _80 = as_type<float>(_72);
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _78;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _543 = as_type<float>(_88);
        out.gl_Position.z = _543;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _80 = _108;
    }
    float _110 = _80;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_33.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _612 = as_type<float>(_124);
        out.gl_Position.z = _612;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_37.x;
    float _128 = in.m_37.y;
    float _130 = in.m_37.z;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _134 = in.m_39.x;
    float _136 = in.m_39.y;
    float _138 = in.m_39.z;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_41.w;
    float _146 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _150 = _148 != 0;
    float _152 = in.m_43.x;
    float _154 = in.m_43.y;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _158 = in.m_45.y;
    float _160 = in.m_45.x;
    float _162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _126);
    float _164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _128);
    float _166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _130);
    float _168 = in.m_30.x;
    float _170 = in.m_30.y;
    float _172 = in.m_30.z;
    float _174 = _136 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _176 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    out.m_47.w = _144;
    float _178 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _180 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _184 = _154 > 0.5;
    float _186 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].w, _146);
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _190 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _192 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _194 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _182);
    float _196 = _154;
    float _198 = _158;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_142)
    {
        float _202 = in.m_43.x;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _208 = fma(_192, -2.0, _156);
    float _210 = _178 * _164;
    float _212 = -_188;
    float _214 = fma(_190, 2.0, _212);
    float _216 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _218 = _206 * _162;
    float _220 = _210 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _222 = _210 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _224 = _216 * _166;
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _228 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[10].x, _220);
    float _232 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[8].x, _222);
    float _234 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _226);
    float _236 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _228);
    float _238 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].z, _230);
    float _240 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[8].z, _232);
    float _242 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    float _244 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _236);
    float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _248 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = _242 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _252 = _244 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _254 = _204 > 0.5;
    bool _256 = _254 && _142;
    float _258 = -_158;
    float _260 = _258 + 1.0;
    float _262 = _250 + _238;
    float _264 = _252 + _240;
    float _266 = _210 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _274 = _264 + _272;
    float _276 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[9].x, _266);
    float _278 = _270 * _270;
    float _280 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _208);
    float _282 = _168;
    float _284 = _172;
    if (_150)
    {
        float _286 = _184 ? _260 : _158;
        _198 = _286;
    }
    float _288 = _198;
    float _290 = fma(_274, _274, _278);
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _298 = sqrt(_290);
    float _300 = _246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _304 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    if (_142)
    {
        _200 = _160;
    }
    float _306 = _200;
    float _308 = _292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _312 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _314 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _316 = _306;
    if (_256)
    {
        float _318 = -_306;
        float _320 = _318 + 1.0;
        _316 = _320;
    }
    float _322 = _316;
    float _324 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[9].z, _276);
    float _326 = _312 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_142)
    {
        _282 = _160;
    }
    float _328 = _282;
    float _330 = fma(_300, _288, -0.5);
    float _332 = _328;
    if (_142)
    {
        _332 = _322;
    }
    float _334 = _332;
    out.m_49.x = _308;
    out.m_49.y = _310;
    out.m_49.z = _314;
    out.m_49.w = _302;
    bool _336 = _298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _338 = _132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _340 = _326 + _324;
    float _342 = -_106;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _214);
    float _346 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _186);
    float _348 = fma(_338, _334, -0.5);
    float _350 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _194);
    float _352 = _334;
    float _354 = _338;
    if (!_336)
    {
        _284 = _264;
    }
    float _356 = _284;
    float _358 = -_280;
    float _360 = fma(_346, _330, _358);
    float _362 = _356;
    if (!_336)
    {
        _352 = _262;
    }
    float _364 = _352;
    float _366 = _364;
    if (!_336)
    {
        _354 = _340;
    }
    float _368 = _354;
    bool _370 = !_336;
    float _372 = _368;
    if (!_370)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _378 = _298 + _376;
        float _380 = _340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = rsqrt(_290);
        float _384 = _378 * _374;
        float _386 = _384 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = cos(_388);
        float _392 = _386 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 + (-1.0);
        float _398 = _396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = fma(_394, _380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = fma(_340, _390, _398);
        float _404 = _382 * _400;
        float _406 = fma(_274, _404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_270, _404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _372 = _402;
        _362 = _406;
        _366 = _408;
    }
    float _410 = _372;
    float _412 = _362;
    float _414 = _366;
    float _416 = _410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _418 = _410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _422 = _410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[0].x, _418);
    float _428 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[2].x, _420);
    float _430 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[3].x, _422);
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _424);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _426);
    float _436 = fma(_350, _348, _344);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _428);
    float _440 = _432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _442 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _430);
    float _444 = _434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _446 = _438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _448 = _440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _450 = _440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _452 = _440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _454 = _440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _448);
    float _458 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _450);
    float _460 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _452);
    float _462 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _454);
    float _464 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _456);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _458);
    float _468 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _460);
    float _470 = _442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _472 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _462);
    float _474 = _360 + 0.5;
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _466);
    float _478 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _480 = _436 + 0.5;
    float _482 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _464);
    float _484 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _468);
    float _486 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _472);
    out.m_51.w = _478;
    out.m_53.x = _480;
    out.m_53.y = _474;
    out.m_33.x = 1.0;
    out.gl_Position.x = _476;
    out.gl_Position.y = _482;
    out.gl_Position.z = _484;
    out.gl_Position.w = _486;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


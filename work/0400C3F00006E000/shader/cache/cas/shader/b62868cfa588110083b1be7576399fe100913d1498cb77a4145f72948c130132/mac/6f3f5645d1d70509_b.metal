#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

static inline __attribute__((always_inline))
void _82(thread const int& _5358, thread const int& _5359, thread const int& _5360, thread const int& _5361, thread int& _5362, thread int& _5363, thread int& _5364, thread int& _5365, thread int& _5366, thread int& _5367, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _5370 = _5358;
    int _5372 = _5359;
    int _5374 = _5360;
    float _5376 = as_type<float>(_5360) + 0.0;
    bool _5378 = _5376 != 0.0;
    bool _5380 = isnan(_5376);
    bool _5382 = _5378 || _5380;
    bool _5384 = isnan(0.0);
    bool _5386 = _5382 || _5384;
    int _5388 = _5386 ? (-1) : 0;
    if (!_5386)
    {
        float _5390 = as_type<float>(_5360) * 1.0;
        _5370 = as_type<int>(_5390);
    }
    int _5392 = _5370;
    bool _5394 = !_5386;
    int _5396 = _5392;
    int _5398 = _5392;
    if (!_5394)
    {
        float _5400 = as_type<float>(_5360) + 0.0;
        bool _5402 = _5400 >= 0.0;
        bool _5404 = isnan(_5400);
        bool _5406 = _5402 || _5404;
        bool _5408 = isnan(0.0);
        bool _5410 = _5406 || _5408;
        _5388 = _5410 ? (-1) : 0;
        if (!_5410)
        {
            _5396 = 2147483647;
        }
        int _5412 = _5396;
        bool _5414 = !_5410;
        int _5416 = _5412;
        _5398 = _5412;
        if (!_5414)
        {
            float _5418 = abs(as_type<float>(_5360));
            float _5420 = _5418 + 0.0;
            bool _5422 = _5420 > as_type<float>(0x7f800000u /* inf */);
            bool _5424 = isnan(_5420);
            bool _5426 = _5422 || _5424;
            bool _5428 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5430 = _5426 || _5428;
            _5388 = _5430 ? (-1) : 0;
            if (_5430)
            {
                float _5432 = as_type<float>(_5360) + 1.0;
                _5416 = as_type<int>(_5432);
            }
            int _5434 = _5416;
            int _5436 = _5434;
            _5398 = _5434;
            if (!_5430)
            {
                float _5438 = abs(as_type<float>(_5360));
                float _5440 = _5438 + (-0.0);
                float _5442 = 0.0 + _5440;
                bool _5444 = _5442 != as_type<float>(0x7f800000u /* inf */);
                bool _5446 = isnan(_5442);
                bool _5448 = _5444 || _5446;
                bool _5450 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5452 = _5448 || _5450;
                _5388 = _5452 ? (-1) : 0;
                if (!_5452)
                {
                    _5436 = _5360;
                }
                int _5454 = _5436;
                bool _5456 = !_5452;
                _5398 = _5454;
                if (!_5456)
                {
                    float _5458 = as_type<float>(_5360) * 18446744073709551616.0;
                    float _5460 = rsqrt(_5458);
                    float _5462 = _5458 * _5460;
                    float _5464 = _5460 * 0.5;
                    float _5466 = -_5462;
                    float _5468 = 0.0 + _5466;
                    float _5470 = fma(_5464, _5468, 0.5);
                    float _5472 = fma(_5462, _5470, _5462);
                    float _5474 = -_5472;
                    float _5476 = 0.0 + _5474;
                    float _5478 = fma(_5472, _5476, _5458);
                    float _5480 = fma(_5464, _5478, _5472);
                    float _5482 = _5480 * 2.3283064365386962890625e-10;
                    _5398 = as_type<int>(_5482);
                    _5372 = as_type<int>(_5472);
                    _5374 = as_type<int>(_5468);
                }
            }
        }
    }
    int _5484 = _5398;
    int _5486 = _5372;
    int _5488 = _5374;
    int _5490 = _5388;
    _5362 = _5361;
    _5363 = 0;
    _5364 = _5484;
    _5365 = _5486;
    _5366 = _5488;
    _5367 = _5490;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1498 = false;
    bool _1126 = false;
    bool _480 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _90 = int(_88);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2128 = as_type<float>(_106);
        out.gl_Position.z = _2128;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_142);
        out.gl_Position.z = _2196;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = in.m_51.x;
    float _376 = in.m_51.y;
    float _378 = in.m_51.z;
    float _380 = _314 * _352;
    float _382 = _298 * _366;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = fma(_362, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = _392 * _368;
    float _400 = _394 * _368;
    float _402 = _396 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _380, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _380, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _380, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _444 = _434 * _374;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _448 = _436 * _376;
    float _450 = _438 * _378;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _454 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _460 = !_364;
    float _478;
    if (!_460)
    {
        float _462 = in.m_53.x;
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _470 = _468 * _464;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = true;
    }
    else
    {
        float _482 = float(_90);
        float _484 = 1.0 / _482;
        float _486 = _124 * _484;
        _478 = _486;
    }
    _480 = false;
    float _488 = _478;
    float _490 = in.m_53.x;
    float _492 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _494 = in.m_53.w;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _498 = _496 != 0;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _500;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _510 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _512 = 1.0 / _502;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _516 = _514 != 0;
    float _518 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _520 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _492);
    float _522 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _510);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _526 = _488 + _524;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _530 = _528 != 0;
    float _532 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _520);
    float _534 = _430;
    bool _536 = _530;
    if (_498)
    {
        float _538 = in.m_53.z;
        _534 = _538;
    }
    float _540 = _534;
    float _542 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = in.m_55.x;
    float _546 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _546;
    bool _550 = false;
    if (_516)
    {
        bool _552 = _490 > 0.5;
        _550 = _552;
    }
    bool _554 = _550;
    float _556 = _526 * _512;
    float _558 = _490 * 6.283185482025146484375;
    float _560 = in.m_55.y;
    bool _562 = _494 > 0.5;
    bool _564 = _562 && _530;
    float _566 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _518);
    float _568 = _518;
    float _570 = _566;
    if (!_506)
    {
        float _572 = in.m_53.y;
        _568 = _572;
    }
    float _574 = _568;
    float _576 = _558 * 0.15915493667125701904296875;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _580 = _578 != 0;
    float _582 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _584;
    float _588 = _576 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = in.m_59.x;
    float _594 = in.m_59.y;
    float _596 = in.m_59.z;
    float _598 = _582;
    if (_498)
    {
        bool _600 = _540 > 0.5;
        _536 = _600;
    }
    bool _602 = _536;
    float _604 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = 0.0;
    if (!_506)
    {
        float _608 = in.m_53.z;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _614 = _548 * _548;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _618;
    float _622 = fma(_586, _586, _614);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _630 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _632;
    float _636 = -_560;
    float _638 = _636 + 1.0;
    float _640 = _576 * 6.283185482025146484375;
    float _642 = cos(_640);
    float _644 = fma(_620, _556, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _646 = fma(_634, _556, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _648 = _620;
    float _650 = _626;
    int _652 = as_type<int>(_644);
    if (!_506)
    {
        _648 = _574;
    }
    float _654 = _648;
    float _656 = fma(_630, _630, _622);
    float _658 = _564 ? _638 : _560;
    float _660 = fma(_626, _556, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = _590 * _592;
    float _664 = _616 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _666 = _654;
    float _668 = _574;
    int _670 = as_type<int>(_660);
    if (_506)
    {
        float _672 = in.m_53.x;
        float _674 = in.m_53.y;
        _666 = _672;
        _668 = _674;
    }
    float _676 = _666;
    float _678 = _668;
    bool _680 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _682 = isnan(_488);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _694 = fma(_664, _658, -0.5);
    bool _696 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _698 = isnan(_488);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = _610;
    if (!_506)
    {
        _570 = _610;
    }
    float _712 = _570;
    float _714 = _642 * _592;
    float _716 = _532 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = -_662;
    float _720 = fma(_642, _596, _718);
    float _722 = -_708;
    float _724 = _722 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _726 = fma(_590, _596, _714);
    float _728 = -_716;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _712;
    if (!_498)
    {
        _598 = _544;
    }
    float _740 = _598;
    float _742 = _730 * _730;
    float _744 = -_732;
    float _746 = _744 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _748 = _690 * _736;
    float _750 = _740;
    if (!_516)
    {
        _650 = _544;
    }
    float _752 = _650;
    float _754 = fma(_724, _724, _742);
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _758 = _660 * _748;
    float _760 = _752;
    if (_498)
    {
        float _762 = -_544;
        float _764 = _762 + 1.0;
        _670 = as_type<int>(_764);
    }
    int _766 = _670;
    float _768 = fma(_746, _746, _754);
    float _770 = _644 * _748;
    if (_516)
    {
        float _772 = -_544;
        float _774 = _772 + 1.0;
        _652 = as_type<int>(_774);
    }
    int _776 = _652;
    if (_506)
    {
        _738 = _678;
    }
    float _778 = _738;
    float _780 = _646 * _748;
    if (_506)
    {
        _710 = _678;
    }
    float _782 = _710;
    float _784 = rsqrt(_768);
    bool _786 = _678 > 0.5;
    bool _788 = _786 && _580;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _716 + _790;
    if (_498)
    {
        float _794 = _602 ? as_type<float>(_766) : _544;
        _750 = _794;
    }
    float _796 = _750;
    float _798 = -_690;
    float _800 = _798 + 1.0;
    float _802 = _792 * _792;
    if (_516)
    {
        float _804 = _554 ? as_type<float>(_776) : _544;
        _760 = _804;
    }
    float _806 = _760;
    float _808 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].x, _770);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].y, _758);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].z, _780);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _708 + _816;
    float _820 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[83].z, _692);
    float _822 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[83].w, _812);
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _826 = _732 + _824;
    float _828 = fma(_818, _818, _802);
    float _830 = _724 * _784;
    float _832 = _730 * _784;
    float _834 = _746 * _784;
    float _836 = fma(_826, _826, _828);
    float _838 = _676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _840 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _842 = sqrt(_656);
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _846 = _832 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _848 = -_840;
    float _850 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[10].y, _848);
    float _852 = -_844;
    float _854 = fma(_838, 2.0, _852);
    float _856 = _830 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _858 = -_846;
    float _860 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[9].y, _858);
    float _862 = _850 * _850;
    float _864 = rsqrt(_836);
    float _866 = -_856;
    float _868 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[8].y, _866);
    float _870 = _778 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = fma(_860, _860, _862);
    float _874 = _788 ? _638 : _560;
    float _876 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _820);
    float _878 = fma(_868, _868, _872);
    float _880 = precise::max(_842, 5.0);
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _884 = _756 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    float _888 = precise::min(_880, 50.0);
    float _890 = rsqrt(_878);
    float _892 = fma(_870, -2.0, _882);
    float _894 = fma(_884, _796, -0.5);
    float _896 = _792 * _864;
    float _898 = -_124;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[81].x, _854);
    float _902 = _818 * _864;
    float _904 = fma(_888, 0.01745335571467876434326171875, 0.174532234668731689453125);
    float _906 = -_896;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _910 = fma(_876, _894, _900);
    float _912 = -_902;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _916 = _904 * 0.15915493667125701904296875;
    float _918 = _908 * _908;
    float _920 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _892);
    float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _924 = _874 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _926 = fma(_914, _914, _918);
    float _928 = _860 * _890;
    float _930 = _826 * _864;
    float _932 = _850 * _890;
    float _934 = _868 * _890;
    float _936 = _928 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _938 = -_930;
    float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _826);
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _944 = _934 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = -_936;
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].y, _946);
    float _950 = fma(_940, _940, _926);
    float _952 = _932 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _954 = -_944;
    float _956 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[10].y, _954);
    float _958 = _948 * _948;
    float _960 = -_920;
    float _962 = fma(_886, _694, _960);
    float _964 = -_952;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[9].y, _964);
    float _968 = _916 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = fma(_956, _956, _958);
    float _974 = _924 * _922;
    float _976 = _806 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _978 = _910 + 0.5;
    float _980 = fma(_966, _966, _972);
    float _982 = _976 * _942;
    float _984 = _916 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _962 + 0.5;
    float _990 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].x, _808);
    float _992 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].y, _810);
    float _994 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].z, _814);
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _726);
    out.m_61.x = _982;
    out.m_61.y = _974;
    out.m_61.z = _978;
    out.m_61.w = _988;
    float _998 = rsqrt(_980);
    float _1000 = _720 * _970;
    float _1002 = sqrt(_950);
    float _1004 = _720 * _986;
    float _1006 = -_1000;
    float _1008 = fma(_986, _594, _1006);
    float _1010 = fma(_970, _594, _1004);
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1014 = _948 * _998;
    float _1016 = _956 * _998;
    float _1018 = _966 * _998;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1010);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = _864 * _1002;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1028 = _542 * _1024;
    float _1030 = _604 * _1024;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1026);
    float _1034 = _612 * _1024;
    float _1036 = _1028 * _1012;
    float _1038 = _1030 * _996;
    float _1040 = abs(_1032);
    float _1042 = -_1040;
    float _1044 = _1042 + 1.0;
    float _1046 = _1034 * _1020;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1050 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1052 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1054 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1048);
    int _1056 = as_type<int>(_1044) + (-218103808);
    float _1058 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1050);
    float _1060 = abs(_1032);
    float _1062 = fma(_1060, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1064 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1052);
    bool _1066 = uint(_1056) >= 1920991232u;
    float _1068 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1058);
    float _1070 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1072 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1074 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1076 = abs(_1032);
    float _1078 = fma(_1076, _1062, -0.212114393711090087890625);
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1054);
    float _1082 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1064);
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = abs(_1032);
    float _1092 = fma(_1090, _1078, 1.570728778839111328125);
    bool _1094 = _1032 < 0.0;
    float _1096 = float(_1094);
    bool _1098 = !_1066;
    float _1100 = _1080;
    float _1102 = _1068;
    float _1124;
    if (!_1098)
    {
        int _1104 = as_type<int>(_996);
        int _1106 = as_type<int>(_1012);
        int _1108 = as_type<int>(_1044);
        int _1110 = 6112;
        int _1112;
        int _1114;
        int _1116;
        int _1118;
        int _1120;
        int _1122;
        _82(_1104, _1106, _1108, _1110, _1112, _1114, _1116, _1118, _1120, _1122, out.gl_Position, out.gl_PointSize);
        _1124 = as_type<float>(_1116);
        _1126 = true;
    }
    else
    {
        float _1128 = rsqrt(_1044);
        float _1130 = _1044 * _1128;
        float _1132 = _1128 * 0.5;
        float _1134 = -_1130;
        float _1136 = 0.0 + _1134;
        float _1138 = fma(_1132, _1136, 0.5);
        float _1140 = fma(_1130, _1138, _1130);
        float _1142 = -_1140;
        float _1144 = 0.0 + _1142;
        float _1146 = fma(_1140, _1144, _1044);
        float _1148 = fma(_1132, _1146, _1140);
        _1124 = _1148;
    }
    _1126 = false;
    float _1150 = _1124;
    float _1152 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1154 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1156 = _1092 * _1150;
    float _1158 = -_1152;
    float _1160 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1158);
    float _1162 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1164 = -_1154;
    float _1166 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1164);
    float _1168 = _1160 * _1160;
    float _1170 = -_1162;
    float _1172 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1174 = _1096 * 2.0;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1178 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1176;
    float _1180 = fma(_1166, _1166, _1168);
    float _1182 = -_1174;
    float _1184 = fma(_1156, _1182, _1156);
    float _1186 = fma(_1172, _1172, _1180);
    float _1188 = fma(_1096, 3.1415927410125732421875, _1184);
    float _1190 = rsqrt(_1186);
    float _1192 = _1188 * 0.15915493667125701904296875;
    float _1194 = _1192 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1160 * _1190;
    float _1200 = _1166 * _1190;
    float _1202 = _1172 * _1190;
    float _1204 = _1198 * _1198;
    float _1206 = fma(_1200, _1200, _1204);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1210 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1208;
    float _1212 = fma(_1202, _1202, _1206);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1216 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1214;
    float _1218 = -_1210;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = rsqrt(_1212);
    float _1224 = -_1216;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1226 * _1226;
    float _1230 = _1192 * 6.283185482025146484375;
    float _1232 = sin(_1230);
    float _1234 = fma(_1220, _1220, _1228);
    float _1236 = -_1178;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = fma(_1238, _1238, _1234);
    float _1242 = _1200 * _1222;
    float _1244 = _1202 * _1222;
    float _1246 = -_1196;
    float _1248 = _1246 + 1.0;
    float _1250 = _1198 * _1222;
    float _1252 = sqrt(_1240);
    float _1254 = _1242 * _1248;
    float _1256 = _1250 * _1248;
    float _1258 = _1244 * _1232;
    float _1260 = _1242 * _1232;
    float _1262 = _1250 * _1232;
    float _1264 = _1244 * _1244;
    float _1266 = -_1258;
    float _1268 = fma(_1250, _1254, _1266);
    float _1270 = fma(_1244, _1256, _1260);
    float _1272 = fma(_1242, _1254, _1196);
    float _1274 = -_1260;
    float _1276 = fma(_1244, _1256, _1274);
    float _1278 = _1068 * _1268;
    float _1280 = -_1262;
    float _1282 = fma(_1244, _1254, _1280);
    float _1284 = _1068 * _1270;
    float _1286 = fma(_1248, _1264, _1196);
    float _1288 = fma(_1080, _1272, _1278);
    float _1290 = fma(_1244, _1254, _1262);
    float _1292 = fma(_1080, _1282, _1284);
    float _1294 = fma(_1252, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1296 = fma(_1250, _1256, _1196);
    float _1298 = fma(_1082, _1290, _1288);
    float _1300 = fma(_1082, _1286, _1292);
    float _1302 = fma(_1250, _1254, _1258);
    float _1304 = precise::max(_1294, 0.3499999940395355224609375);
    float _1306 = _708 + _1298;
    float _1308 = _732 + _1300;
    float _1310 = _1068 * _1296;
    float _1312 = precise::min(_1304, 1.0);
    float _1314 = -_1210;
    float _1316 = _1306 + _1314;
    float _1318 = -_1178;
    float _1320 = _1308 + _1318;
    float _1322 = fma(_1080, _1302, _1310);
    float _1324 = fma(_1316, _1312, _1210);
    float _1326 = fma(_1320, _1312, _1178);
    float _1328 = fma(_1082, _1276, _1322);
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1332 = _1324 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1336 = _1326 + _1334;
    float _1338 = _716 + _1328;
    float _1340 = _1332 * _1332;
    float _1342 = _1336 * _1336;
    float _1344 = -_1216;
    float _1346 = _1338 + _1344;
    float _1348 = _1340 + _1342;
    float _1350 = fma(_1346, _1312, _1216);
    float _1352 = sqrt(_1348);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = _1322;
    float _1358 = _1216;
    float _1360 = _1346;
    float _1362 = _1324;
    if (!_1354)
    {
        _1356 = _1342;
    }
    float _1364 = _1356;
    float _1366 = _1364;
    if (!_1354)
    {
        _1100 = _1340;
    }
    float _1368 = _1100;
    float _1370 = _1368;
    if (!_1354)
    {
        _1358 = _1324;
    }
    float _1372 = _1358;
    float _1374 = _1372;
    if (!_1354)
    {
        _1102 = _1326;
    }
    float _1376 = _1102;
    float _1378 = _1376;
    if (!_1354)
    {
        _1360 = _1350;
    }
    float _1380 = _1360;
    bool _1382 = !_1354;
    float _1384 = _1380;
    if (!_1382)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1390 = _1352 + _1388;
        float _1392 = _1350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = rsqrt(_1348);
        float _1396 = _1390 * _1386;
        float _1398 = _1396 * 0.15915493667125701904296875;
        float _1400 = _1398 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        float _1408 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1394 * _1408;
        float _1412 = _1406 + (-1.0);
        float _1414 = _1336 * _1410;
        float _1416 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = _1332 * _1410;
        float _1420 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1422 = _1414 * _1414;
        float _1424 = fma(_1350, _1406, _1416);
        float _1426 = _1418 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1428 = _1418 * _1418;
        _1384 = _1424;
        _1370 = _1428;
        _1366 = _1422;
        _1374 = _1426;
        _1378 = _1420;
    }
    float _1430 = _1384;
    float _1432 = _1370;
    float _1434 = _1366;
    float _1436 = _1374;
    float _1438 = _1378;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1442 = _1430 + _1440;
    out.m_63.x = _454;
    out.m_63.y = _456;
    out.m_63.z = _458;
    out.m_63.w = _452;
    float _1444 = fma(_1442, _1442, _1432);
    out.m_65.x = _1084;
    out.m_65.y = _1086;
    out.m_65.z = _1088;
    float _1446 = _1444 + _1434;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1452 = isnan(_1448);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1458 = _1454 || _1456;
    float _1460 = _1444;
    float _1462 = _1430;
    if (!_1458)
    {
        _1460 = 1.0;
    }
    float _1464 = _1460;
    bool _1466 = !_1458;
    float _1468 = _1464;
    if (!_1466)
    {
        bool _1470 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1472 = isnan(_1448);
        bool _1474 = _1470 || _1472;
        bool _1476 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1478 = _1474 || _1476;
        if (!_1478)
        {
            float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1482 = _1448 + _1480;
            float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1486 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1484;
            float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1490 = _1488 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1492 = 1.0 / _1486;
            float _1494 = _1482 * _1492;
            float _1496 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1468 = _1496;
            _1498 = true;
        }
        else
        {
            bool _1500 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1502 = isnan(_1448);
            bool _1504 = _1500 || _1502;
            bool _1506 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1508 = _1504 || _1506;
            if (!_1508)
            {
                float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1512 = _1448 + _1510;
                float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1516 = _1514 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1520 = _1518 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1522 = 1.0 / _1516;
                float _1524 = _1512 * _1522;
                float _1526 = fma(_1524, _1520, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1468 = _1526;
                _1498 = true;
            }
            else
            {
                _1468 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1498 = false;
    float _1528 = _1468;
    float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1532 = _1430 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1536 = _1436 + _1534;
    float _1538 = fma(_1532, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1542 = _1438 + _1540;
    float _1544 = fma(_1536, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1546 = -_896;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = fma(_1542, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1552 = -_902;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1544);
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1558 = _1548 + _1556;
    float _1560 = -_930;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1550);
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1566 = _1554 + _1564;
    float _1568 = _1558 * _1558;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1572 = _1562 + _1570;
    float _1574 = fma(_1566, _1566, _1568);
    float _1576 = fma(_1572, _1572, _1574);
    float _1578 = rsqrt(_1576);
    float _1580 = sqrt(_1576);
    float _1582 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1584 = _1566 * _1582;
    float _1586 = _1572 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 * _1586;
    float _1592 = _1588 + _1590;
    float _1594 = sqrt(_1592);
    bool _1596 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1600 = _1594 + _1598;
    float _1602 = _1572;
    float _1604 = _1568;
    float _1606 = _1600;
    float _1608 = _1558;
    float _1610 = _1544;
    float _1612 = _1584;
    if (_1596)
    {
        float _1614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1602 = _1614;
    }
    float _1616 = _1602;
    if (_1596)
    {
        float _1618 = rsqrt(_1592);
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1596)
    {
        float _1624 = _1600 * _1616;
        _1606 = _1624;
    }
    float _1626 = _1606;
    if (_1596)
    {
        float _1628 = _1626 * 0.15915493667125701904296875;
        _1462 = _1628;
    }
    float _1630 = _1462;
    float _1632 = _1578;
    if (_1596)
    {
        float _1634 = _1630 * 6.283185482025146484375;
        float _1636 = sin(_1634);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1642 = precise::max(0.0, _1640);
    float _1644 = _1616;
    float _1646 = _1642;
    if (_1596)
    {
        float _1648 = _1630 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        _1644 = _1650;
    }
    float _1652 = _1644;
    float _1654 = -_1582;
    float _1656 = -_1642;
    float _1658 = fma(_1558, _1654, _1656);
    if (_1596)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1660;
    }
    float _1662 = _1608;
    float _1664 = _1638;
    float _1666 = _1662;
    if (_1596)
    {
        float _1668 = fma(_1638, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = _1670;
    if (!_1596)
    {
        _1666 = _1590;
    }
    float _1674 = _1666;
    float _1676 = _1674;
    if (_1596)
    {
        float _1678 = _1652 + (-1.0);
        _1646 = _1678;
    }
    float _1680 = _1646;
    float _1682 = _1680;
    if (_1596)
    {
        float _1684 = _1620 * _1670;
        _1362 = _1684;
    }
    float _1686 = _1362;
    if (!_1596)
    {
        _1622 = _1658;
    }
    float _1688 = _1622;
    float _1690 = _1688;
    if (_1596)
    {
        float _1692 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1610 = _1692;
    }
    float _1694 = _1610;
    if (_1596)
    {
        float _1696 = _1584 * _1686;
        _1612 = _1696;
    }
    float _1698 = _1612;
    if (!_1596)
    {
        _1672 = _1586;
    }
    float _1700 = _1672;
    float _1702 = _1700;
    if (_1596)
    {
        float _1704 = _1586 * _1686;
        _1702 = _1704;
    }
    float _1706 = _1702;
    if (!_1596)
    {
        _1682 = _1588;
    }
    float _1708 = _1682;
    float _1710 = _1708;
    if (_1596)
    {
        float _1712 = fma(_1658, _1652, _1694);
        _1690 = _1712;
    }
    float _1714 = _1690;
    if (_1596)
    {
        float _1716 = _1698 * _1698;
        _1710 = _1716;
    }
    float _1718 = _1710;
    if (_1596)
    {
        float _1720 = _1706 * _1706;
        _1676 = _1720;
    }
    float _1722 = _1676;
    float _1724 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = fma(_1714, _1714, _1718);
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = _1726 + _1722;
    float _1736 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1740 = -_1732;
    float _1742 = _1740 + 1.0;
    float _1744 = rsqrt(_1734);
    float _1746 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1736);
    float _1748 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1754 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1756 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1760 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = abs(_1742);
    float _1768 = log2(_1766);
    float _1770 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1758);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1776 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1778 = _1744 * _1698;
    float _1780 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = _1744 * _1714;
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1788 = _1744 * _1706;
    float _1790 = -_1776;
    float _1792 = fma(_1790, _1738, 1.0);
    float _1794 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1784);
    float _1796 = -_1786;
    float _1798 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1796);
    float _1800 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1802 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1804 = -_1788;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1798);
    float _1808 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1794);
    float _1810 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = exp2(_1802);
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1808);
    float _1818 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = fma(_1806, 0.5, 0.5);
    float _1822 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1800);
    float _1824 = _1782 + 1.0;
    float _1826 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1828 = log2(_1792);
    float _1830 = fma(_1820, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1832 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1822);
    float _1834 = fma(_1820, _1830, -0.212114393711090087890625);
    float _1836 = 1.0 / _1816;
    float _1838 = -_1782;
    float _1840 = fma(_1812, _1824, _1838);
    float _1842 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1826);
    float _1844 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1832);
    float _1846 = fma(_1820, _1834, 1.570728778839111328125);
    float _1848 = fma(_1840, 0.5, 0.5);
    float _1850 = sqrt(_1814);
    float _1852 = _1828 * 0.693147182464599609375;
    float _1854 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = _1842 * _1836;
    float _1858 = _1844 * _1836;
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = fma(_1858, -0.5, 0.5);
    float _1864 = _1850 * 0.636619746685028076171875;
    float _1866 = -_1846;
    float _1868 = fma(_1864, _1866, 1.0);
    float3 _5010 = float3(_1860, _1862, _1854);
    float _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).x;
    float3 _5021 = float3(_1860, _1862, _1854);
    float4 _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).xyzw;
    float _1875 = _1873.x;
    float _1877 = _1873.y;
    float _1879 = _1873.z;
    float _1881 = _1873.w;
    float2 _5038 = float2(_1868, _1848);
    float3 _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5038, float2(0.0), isnan(_5038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5038, float2(0.0), isnan(_5038)), level(0.0)).xyz;
    float _1887 = _1885.x;
    float _1889 = _1885.y;
    float _1891 = _1885.z;
    float _1893 = -_896;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _716);
    float _1897 = -_902;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _1901 = -_930;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1905 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1907 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1909 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1907);
    float _1913 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1917 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1919 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1913);
    float _1921 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1923 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1917);
    float _1925 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1927 = 1.0 / _1921;
    bool _1929 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan(0.5);
    bool _1937 = _1933 || _1935;
    float _1939 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1943 = exp2(_1905);
    float _1945 = _1941 + _1921;
    float _1947 = _1945 * _1927;
    float _1949 = _1947 * 0.5;
    float _1951 = _1927;
    if (_1937)
    {
        _1951 = 1.0;
    }
    float _1953 = _1951;
    float _1955 = _1953;
    if (!_1937)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
        float _1963 = _1957 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1967;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1961;
        float _1987 = _1981 * _1983;
        float _1989 = _1971 * 6.283185482025146484375;
        float _1991 = sin(_1989);
        float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1993;
        float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1999 = _1985 * _1997;
        float _2001 = 1.0 / _1987;
        float _2003 = 1.0 / _1995;
        float _2005 = _1991 * _2001;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2009 = fma(_2005, _1999, _2007);
        float _2011 = _2009 * _2003;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        float _2015 = -_2013;
        float _2017 = _2015 + 1.0;
        _1955 = _2017;
    }
    float _2019 = _1955;
    float _2021 = -_1943;
    float _2023 = _2021 + 1.0;
    bool _2025 = _2019 > 0.0;
    bool _2027 = isnan(_2019);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _1925 + _1816;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2041 = _1842 + _1816;
    float _2043 = _1816 * 0.5;
    out.gl_Position.x = _1842;
    out.gl_Position.y = _1844;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1816;
    float _2045 = _2039 * _1870;
    float _2047 = -_2039;
    float _2049 = _2047 + 1.0;
    float _2051 = _2037 * 0.5;
    float _2053 = _1881 * _2045;
    float _2055 = _1891 * _2045;
    float _2057 = _2041 * 0.5;
    float _2059 = fma(_1844, -0.5, _2043);
    float _2061 = fma(_1887, _2053, _1875);
    float _2063 = fma(_1889, _2053, _1877);
    float _2065 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2067 = _1881 * _2049;
    float _2069 = fma(_1881, _2055, _1879);
    out.m_67.x = _2057;
    out.m_67.y = _2059;
    out.m_67.z = _2051;
    out.m_67.w = _1816;
    out.m_47.x = _2065;
    out.m_69.x = _2061;
    out.m_69.y = _2063;
    out.m_69.z = _2069;
    out.m_69.w = _2067;
    if (_2033)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1498 = false;
    bool _1126 = false;
    bool _480 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _90 = int(_88);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2128 = as_type<float>(_106);
        out.gl_Position.z = _2128;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_142);
        out.gl_Position.z = _2196;
    }
    if (_136)
    {
        return out;
    }
    float _144 = in.m_51.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = in.m_51.x;
    float _376 = in.m_51.y;
    float _378 = in.m_51.z;
    float _380 = _314 * _352;
    float _382 = _298 * _366;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = fma(_362, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = _392 * _368;
    float _400 = _394 * _368;
    float _402 = _396 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _380, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _380, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _380, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _444 = _434 * _374;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _448 = _436 * _376;
    float _450 = _438 * _378;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _454 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _460 = !_364;
    float _478;
    if (!_460)
    {
        float _462 = in.m_53.x;
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _470 = _468 * _464;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = true;
    }
    else
    {
        float _482 = float(_90);
        float _484 = 1.0 / _482;
        float _486 = _124 * _484;
        _478 = _486;
    }
    _480 = false;
    float _488 = _478;
    float _490 = in.m_53.x;
    float _492 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _494 = in.m_53.w;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _498 = _496 != 0;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _500;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _510 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _512 = 1.0 / _502;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _516 = _514 != 0;
    float _518 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _520 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _492);
    float _522 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _510);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _526 = _488 + _524;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _530 = _528 != 0;
    float _532 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _520);
    float _534 = _430;
    bool _536 = _530;
    if (_498)
    {
        float _538 = in.m_53.z;
        _534 = _538;
    }
    float _540 = _534;
    float _542 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = in.m_55.x;
    float _546 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _546;
    bool _550 = false;
    if (_516)
    {
        bool _552 = _490 > 0.5;
        _550 = _552;
    }
    bool _554 = _550;
    float _556 = _526 * _512;
    float _558 = _490 * 6.283185482025146484375;
    float _560 = in.m_55.y;
    bool _562 = _494 > 0.5;
    bool _564 = _562 && _530;
    float _566 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _518);
    float _568 = _518;
    float _570 = _566;
    if (!_506)
    {
        float _572 = in.m_53.y;
        _568 = _572;
    }
    float _574 = _568;
    float _576 = _558 * 0.15915493667125701904296875;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _580 = _578 != 0;
    float _582 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _584;
    float _588 = _576 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = in.m_59.x;
    float _594 = in.m_59.y;
    float _596 = in.m_59.z;
    float _598 = _582;
    if (_498)
    {
        bool _600 = _540 > 0.5;
        _536 = _600;
    }
    bool _602 = _536;
    float _604 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = 0.0;
    if (!_506)
    {
        float _608 = in.m_53.z;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _614 = _548 * _548;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _618;
    float _622 = fma(_586, _586, _614);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _630 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _632;
    float _636 = -_560;
    float _638 = _636 + 1.0;
    float _640 = _576 * 6.283185482025146484375;
    float _642 = cos(_640);
    float _644 = fma(_620, _556, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _646 = fma(_634, _556, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _648 = _620;
    float _650 = _626;
    int _652 = as_type<int>(_644);
    if (!_506)
    {
        _648 = _574;
    }
    float _654 = _648;
    float _656 = fma(_630, _630, _622);
    float _658 = _564 ? _638 : _560;
    float _660 = fma(_626, _556, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = _590 * _592;
    float _664 = _616 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _666 = _654;
    float _668 = _574;
    int _670 = as_type<int>(_660);
    if (_506)
    {
        float _672 = in.m_53.x;
        float _674 = in.m_53.y;
        _666 = _672;
        _668 = _674;
    }
    float _676 = _666;
    float _678 = _668;
    bool _680 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _682 = isnan(_488);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _694 = fma(_664, _658, -0.5);
    bool _696 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _698 = isnan(_488);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = _610;
    if (!_506)
    {
        _570 = _610;
    }
    float _712 = _570;
    float _714 = _642 * _592;
    float _716 = _532 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = -_662;
    float _720 = fma(_642, _596, _718);
    float _722 = -_708;
    float _724 = _722 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _726 = fma(_590, _596, _714);
    float _728 = -_716;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _712;
    if (!_498)
    {
        _598 = _544;
    }
    float _740 = _598;
    float _742 = _730 * _730;
    float _744 = -_732;
    float _746 = _744 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _748 = _690 * _736;
    float _750 = _740;
    if (!_516)
    {
        _650 = _544;
    }
    float _752 = _650;
    float _754 = fma(_724, _724, _742);
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _758 = _660 * _748;
    float _760 = _752;
    if (_498)
    {
        float _762 = -_544;
        float _764 = _762 + 1.0;
        _670 = as_type<int>(_764);
    }
    int _766 = _670;
    float _768 = fma(_746, _746, _754);
    float _770 = _644 * _748;
    if (_516)
    {
        float _772 = -_544;
        float _774 = _772 + 1.0;
        _652 = as_type<int>(_774);
    }
    int _776 = _652;
    if (_506)
    {
        _738 = _678;
    }
    float _778 = _738;
    float _780 = _646 * _748;
    if (_506)
    {
        _710 = _678;
    }
    float _782 = _710;
    float _784 = rsqrt(_768);
    bool _786 = _678 > 0.5;
    bool _788 = _786 && _580;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _716 + _790;
    if (_498)
    {
        float _794 = _602 ? as_type<float>(_766) : _544;
        _750 = _794;
    }
    float _796 = _750;
    float _798 = -_690;
    float _800 = _798 + 1.0;
    float _802 = _792 * _792;
    if (_516)
    {
        float _804 = _554 ? as_type<float>(_776) : _544;
        _760 = _804;
    }
    float _806 = _760;
    float _808 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].x, _770);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].y, _758);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].z, _780);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _708 + _816;
    float _820 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[83].z, _692);
    float _822 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[83].w, _812);
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _826 = _732 + _824;
    float _828 = fma(_818, _818, _802);
    float _830 = _724 * _784;
    float _832 = _730 * _784;
    float _834 = _746 * _784;
    float _836 = fma(_826, _826, _828);
    float _838 = _676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _840 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _842 = sqrt(_656);
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _846 = _832 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _848 = -_840;
    float _850 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[10].y, _848);
    float _852 = -_844;
    float _854 = fma(_838, 2.0, _852);
    float _856 = _830 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _858 = -_846;
    float _860 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[9].y, _858);
    float _862 = _850 * _850;
    float _864 = rsqrt(_836);
    float _866 = -_856;
    float _868 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[8].y, _866);
    float _870 = _778 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = fma(_860, _860, _862);
    float _874 = _788 ? _638 : _560;
    float _876 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _820);
    float _878 = fma(_868, _868, _872);
    float _880 = precise::max(_842, 5.0);
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _884 = _756 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    float _888 = precise::min(_880, 50.0);
    float _890 = rsqrt(_878);
    float _892 = fma(_870, -2.0, _882);
    float _894 = fma(_884, _796, -0.5);
    float _896 = _792 * _864;
    float _898 = -_124;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[81].x, _854);
    float _902 = _818 * _864;
    float _904 = fma(_888, 0.01745335571467876434326171875, 0.174532234668731689453125);
    float _906 = -_896;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _910 = fma(_876, _894, _900);
    float _912 = -_902;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _916 = _904 * 0.15915493667125701904296875;
    float _918 = _908 * _908;
    float _920 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _892);
    float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _924 = _874 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _926 = fma(_914, _914, _918);
    float _928 = _860 * _890;
    float _930 = _826 * _864;
    float _932 = _850 * _890;
    float _934 = _868 * _890;
    float _936 = _928 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _938 = -_930;
    float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _826);
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _944 = _934 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = -_936;
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].y, _946);
    float _950 = fma(_940, _940, _926);
    float _952 = _932 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _954 = -_944;
    float _956 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[10].y, _954);
    float _958 = _948 * _948;
    float _960 = -_920;
    float _962 = fma(_886, _694, _960);
    float _964 = -_952;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[9].y, _964);
    float _968 = _916 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = fma(_956, _956, _958);
    float _974 = _924 * _922;
    float _976 = _806 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _978 = _910 + 0.5;
    float _980 = fma(_966, _966, _972);
    float _982 = _976 * _942;
    float _984 = _916 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _962 + 0.5;
    float _990 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].x, _808);
    float _992 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].y, _810);
    float _994 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].z, _814);
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _726);
    out.m_61.x = _982;
    out.m_61.y = _974;
    out.m_61.z = _978;
    out.m_61.w = _988;
    float _998 = rsqrt(_980);
    float _1000 = _720 * _970;
    float _1002 = sqrt(_950);
    float _1004 = _720 * _986;
    float _1006 = -_1000;
    float _1008 = fma(_986, _594, _1006);
    float _1010 = fma(_970, _594, _1004);
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1014 = _948 * _998;
    float _1016 = _956 * _998;
    float _1018 = _966 * _998;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1010);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = _864 * _1002;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1028 = _542 * _1024;
    float _1030 = _604 * _1024;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1026);
    float _1034 = _612 * _1024;
    float _1036 = _1028 * _1012;
    float _1038 = _1030 * _996;
    float _1040 = abs(_1032);
    float _1042 = -_1040;
    float _1044 = _1042 + 1.0;
    float _1046 = _1034 * _1020;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1050 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1052 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1054 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1048);
    int _1056 = as_type<int>(_1044) + (-218103808);
    float _1058 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1050);
    float _1060 = abs(_1032);
    float _1062 = fma(_1060, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1064 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1052);
    bool _1066 = uint(_1056) >= 1920991232u;
    float _1068 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1058);
    float _1070 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1072 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1074 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1076 = abs(_1032);
    float _1078 = fma(_1076, _1062, -0.212114393711090087890625);
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1054);
    float _1082 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1064);
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = abs(_1032);
    float _1092 = fma(_1090, _1078, 1.570728778839111328125);
    bool _1094 = _1032 < 0.0;
    float _1096 = float(_1094);
    bool _1098 = !_1066;
    float _1100 = _1080;
    float _1102 = _1068;
    float _1124;
    if (!_1098)
    {
        int _1104 = as_type<int>(_996);
        int _1106 = as_type<int>(_1012);
        int _1108 = as_type<int>(_1044);
        int _1110 = 6112;
        int _1112;
        int _1114;
        int _1116;
        int _1118;
        int _1120;
        int _1122;
        _82(_1104, _1106, _1108, _1110, _1112, _1114, _1116, _1118, _1120, _1122, out.gl_Position, out.gl_PointSize);
        _1124 = as_type<float>(_1116);
        _1126 = true;
    }
    else
    {
        float _1128 = rsqrt(_1044);
        float _1130 = _1044 * _1128;
        float _1132 = _1128 * 0.5;
        float _1134 = -_1130;
        float _1136 = 0.0 + _1134;
        float _1138 = fma(_1132, _1136, 0.5);
        float _1140 = fma(_1130, _1138, _1130);
        float _1142 = -_1140;
        float _1144 = 0.0 + _1142;
        float _1146 = fma(_1140, _1144, _1044);
        float _1148 = fma(_1132, _1146, _1140);
        _1124 = _1148;
    }
    _1126 = false;
    float _1150 = _1124;
    float _1152 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1154 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1156 = _1092 * _1150;
    float _1158 = -_1152;
    float _1160 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1158);
    float _1162 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1164 = -_1154;
    float _1166 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1164);
    float _1168 = _1160 * _1160;
    float _1170 = -_1162;
    float _1172 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1174 = _1096 * 2.0;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1178 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1176;
    float _1180 = fma(_1166, _1166, _1168);
    float _1182 = -_1174;
    float _1184 = fma(_1156, _1182, _1156);
    float _1186 = fma(_1172, _1172, _1180);
    float _1188 = fma(_1096, 3.1415927410125732421875, _1184);
    float _1190 = rsqrt(_1186);
    float _1192 = _1188 * 0.15915493667125701904296875;
    float _1194 = _1192 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1160 * _1190;
    float _1200 = _1166 * _1190;
    float _1202 = _1172 * _1190;
    float _1204 = _1198 * _1198;
    float _1206 = fma(_1200, _1200, _1204);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1210 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1208;
    float _1212 = fma(_1202, _1202, _1206);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1216 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1214;
    float _1218 = -_1210;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = rsqrt(_1212);
    float _1224 = -_1216;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1226 * _1226;
    float _1230 = _1192 * 6.283185482025146484375;
    float _1232 = sin(_1230);
    float _1234 = fma(_1220, _1220, _1228);
    float _1236 = -_1178;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = fma(_1238, _1238, _1234);
    float _1242 = _1200 * _1222;
    float _1244 = _1202 * _1222;
    float _1246 = -_1196;
    float _1248 = _1246 + 1.0;
    float _1250 = _1198 * _1222;
    float _1252 = sqrt(_1240);
    float _1254 = _1242 * _1248;
    float _1256 = _1250 * _1248;
    float _1258 = _1244 * _1232;
    float _1260 = _1242 * _1232;
    float _1262 = _1250 * _1232;
    float _1264 = _1244 * _1244;
    float _1266 = -_1258;
    float _1268 = fma(_1250, _1254, _1266);
    float _1270 = fma(_1244, _1256, _1260);
    float _1272 = fma(_1242, _1254, _1196);
    float _1274 = -_1260;
    float _1276 = fma(_1244, _1256, _1274);
    float _1278 = _1068 * _1268;
    float _1280 = -_1262;
    float _1282 = fma(_1244, _1254, _1280);
    float _1284 = _1068 * _1270;
    float _1286 = fma(_1248, _1264, _1196);
    float _1288 = fma(_1080, _1272, _1278);
    float _1290 = fma(_1244, _1254, _1262);
    float _1292 = fma(_1080, _1282, _1284);
    float _1294 = fma(_1252, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1296 = fma(_1250, _1256, _1196);
    float _1298 = fma(_1082, _1290, _1288);
    float _1300 = fma(_1082, _1286, _1292);
    float _1302 = fma(_1250, _1254, _1258);
    float _1304 = precise::max(_1294, 0.3499999940395355224609375);
    float _1306 = _708 + _1298;
    float _1308 = _732 + _1300;
    float _1310 = _1068 * _1296;
    float _1312 = precise::min(_1304, 1.0);
    float _1314 = -_1210;
    float _1316 = _1306 + _1314;
    float _1318 = -_1178;
    float _1320 = _1308 + _1318;
    float _1322 = fma(_1080, _1302, _1310);
    float _1324 = fma(_1316, _1312, _1210);
    float _1326 = fma(_1320, _1312, _1178);
    float _1328 = fma(_1082, _1276, _1322);
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1332 = _1324 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1336 = _1326 + _1334;
    float _1338 = _716 + _1328;
    float _1340 = _1332 * _1332;
    float _1342 = _1336 * _1336;
    float _1344 = -_1216;
    float _1346 = _1338 + _1344;
    float _1348 = _1340 + _1342;
    float _1350 = fma(_1346, _1312, _1216);
    float _1352 = sqrt(_1348);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = _1322;
    float _1358 = _1216;
    float _1360 = _1346;
    float _1362 = _1324;
    if (!_1354)
    {
        _1356 = _1342;
    }
    float _1364 = _1356;
    float _1366 = _1364;
    if (!_1354)
    {
        _1100 = _1340;
    }
    float _1368 = _1100;
    float _1370 = _1368;
    if (!_1354)
    {
        _1358 = _1324;
    }
    float _1372 = _1358;
    float _1374 = _1372;
    if (!_1354)
    {
        _1102 = _1326;
    }
    float _1376 = _1102;
    float _1378 = _1376;
    if (!_1354)
    {
        _1360 = _1350;
    }
    float _1380 = _1360;
    bool _1382 = !_1354;
    float _1384 = _1380;
    if (!_1382)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1390 = _1352 + _1388;
        float _1392 = _1350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = rsqrt(_1348);
        float _1396 = _1390 * _1386;
        float _1398 = _1396 * 0.15915493667125701904296875;
        float _1400 = _1398 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        float _1408 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1394 * _1408;
        float _1412 = _1406 + (-1.0);
        float _1414 = _1336 * _1410;
        float _1416 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = _1332 * _1410;
        float _1420 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1422 = _1414 * _1414;
        float _1424 = fma(_1350, _1406, _1416);
        float _1426 = _1418 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1428 = _1418 * _1418;
        _1384 = _1424;
        _1370 = _1428;
        _1366 = _1422;
        _1374 = _1426;
        _1378 = _1420;
    }
    float _1430 = _1384;
    float _1432 = _1370;
    float _1434 = _1366;
    float _1436 = _1374;
    float _1438 = _1378;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1442 = _1430 + _1440;
    out.m_63.x = _454;
    out.m_63.y = _456;
    out.m_63.z = _458;
    out.m_63.w = _452;
    float _1444 = fma(_1442, _1442, _1432);
    out.m_65.x = _1084;
    out.m_65.y = _1086;
    out.m_65.z = _1088;
    float _1446 = _1444 + _1434;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1452 = isnan(_1448);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1458 = _1454 || _1456;
    float _1460 = _1444;
    float _1462 = _1430;
    if (!_1458)
    {
        _1460 = 1.0;
    }
    float _1464 = _1460;
    bool _1466 = !_1458;
    float _1468 = _1464;
    if (!_1466)
    {
        bool _1470 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1472 = isnan(_1448);
        bool _1474 = _1470 || _1472;
        bool _1476 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1478 = _1474 || _1476;
        if (!_1478)
        {
            float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1482 = _1448 + _1480;
            float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1486 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1484;
            float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1490 = _1488 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1492 = 1.0 / _1486;
            float _1494 = _1482 * _1492;
            float _1496 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1468 = _1496;
            _1498 = true;
        }
        else
        {
            bool _1500 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1502 = isnan(_1448);
            bool _1504 = _1500 || _1502;
            bool _1506 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1508 = _1504 || _1506;
            if (!_1508)
            {
                float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1512 = _1448 + _1510;
                float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1516 = _1514 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1520 = _1518 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1522 = 1.0 / _1516;
                float _1524 = _1512 * _1522;
                float _1526 = fma(_1524, _1520, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1468 = _1526;
                _1498 = true;
            }
            else
            {
                _1468 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1498 = false;
    float _1528 = _1468;
    float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1532 = _1430 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1536 = _1436 + _1534;
    float _1538 = fma(_1532, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1542 = _1438 + _1540;
    float _1544 = fma(_1536, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1546 = -_896;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = fma(_1542, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1552 = -_902;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1544);
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1558 = _1548 + _1556;
    float _1560 = -_930;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1550);
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1566 = _1554 + _1564;
    float _1568 = _1558 * _1558;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1572 = _1562 + _1570;
    float _1574 = fma(_1566, _1566, _1568);
    float _1576 = fma(_1572, _1572, _1574);
    float _1578 = rsqrt(_1576);
    float _1580 = sqrt(_1576);
    float _1582 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1584 = _1566 * _1582;
    float _1586 = _1572 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 * _1586;
    float _1592 = _1588 + _1590;
    float _1594 = sqrt(_1592);
    bool _1596 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1600 = _1594 + _1598;
    float _1602 = _1572;
    float _1604 = _1568;
    float _1606 = _1600;
    float _1608 = _1558;
    float _1610 = _1544;
    float _1612 = _1584;
    if (_1596)
    {
        float _1614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1602 = _1614;
    }
    float _1616 = _1602;
    if (_1596)
    {
        float _1618 = rsqrt(_1592);
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1596)
    {
        float _1624 = _1600 * _1616;
        _1606 = _1624;
    }
    float _1626 = _1606;
    if (_1596)
    {
        float _1628 = _1626 * 0.15915493667125701904296875;
        _1462 = _1628;
    }
    float _1630 = _1462;
    float _1632 = _1578;
    if (_1596)
    {
        float _1634 = _1630 * 6.283185482025146484375;
        float _1636 = sin(_1634);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1642 = precise::max(0.0, _1640);
    float _1644 = _1616;
    float _1646 = _1642;
    if (_1596)
    {
        float _1648 = _1630 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        _1644 = _1650;
    }
    float _1652 = _1644;
    float _1654 = -_1582;
    float _1656 = -_1642;
    float _1658 = fma(_1558, _1654, _1656);
    if (_1596)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1660;
    }
    float _1662 = _1608;
    float _1664 = _1638;
    float _1666 = _1662;
    if (_1596)
    {
        float _1668 = fma(_1638, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = _1670;
    if (!_1596)
    {
        _1666 = _1590;
    }
    float _1674 = _1666;
    float _1676 = _1674;
    if (_1596)
    {
        float _1678 = _1652 + (-1.0);
        _1646 = _1678;
    }
    float _1680 = _1646;
    float _1682 = _1680;
    if (_1596)
    {
        float _1684 = _1620 * _1670;
        _1362 = _1684;
    }
    float _1686 = _1362;
    if (!_1596)
    {
        _1622 = _1658;
    }
    float _1688 = _1622;
    float _1690 = _1688;
    if (_1596)
    {
        float _1692 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1610 = _1692;
    }
    float _1694 = _1610;
    if (_1596)
    {
        float _1696 = _1584 * _1686;
        _1612 = _1696;
    }
    float _1698 = _1612;
    if (!_1596)
    {
        _1672 = _1586;
    }
    float _1700 = _1672;
    float _1702 = _1700;
    if (_1596)
    {
        float _1704 = _1586 * _1686;
        _1702 = _1704;
    }
    float _1706 = _1702;
    if (!_1596)
    {
        _1682 = _1588;
    }
    float _1708 = _1682;
    float _1710 = _1708;
    if (_1596)
    {
        float _1712 = fma(_1658, _1652, _1694);
        _1690 = _1712;
    }
    float _1714 = _1690;
    if (_1596)
    {
        float _1716 = _1698 * _1698;
        _1710 = _1716;
    }
    float _1718 = _1710;
    if (_1596)
    {
        float _1720 = _1706 * _1706;
        _1676 = _1720;
    }
    float _1722 = _1676;
    float _1724 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = fma(_1714, _1714, _1718);
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = _1726 + _1722;
    float _1736 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1740 = -_1732;
    float _1742 = _1740 + 1.0;
    float _1744 = rsqrt(_1734);
    float _1746 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1736);
    float _1748 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1754 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1756 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1760 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = abs(_1742);
    float _1768 = log2(_1766);
    float _1770 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1758);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1776 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1778 = _1744 * _1698;
    float _1780 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = _1744 * _1714;
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1788 = _1744 * _1706;
    float _1790 = -_1776;
    float _1792 = fma(_1790, _1738, 1.0);
    float _1794 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1784);
    float _1796 = -_1786;
    float _1798 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1796);
    float _1800 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1802 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1804 = -_1788;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1798);
    float _1808 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1794);
    float _1810 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = exp2(_1802);
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1808);
    float _1818 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = fma(_1806, 0.5, 0.5);
    float _1822 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1800);
    float _1824 = _1782 + 1.0;
    float _1826 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1828 = log2(_1792);
    float _1830 = fma(_1820, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1832 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1822);
    float _1834 = fma(_1820, _1830, -0.212114393711090087890625);
    float _1836 = 1.0 / _1816;
    float _1838 = -_1782;
    float _1840 = fma(_1812, _1824, _1838);
    float _1842 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1826);
    float _1844 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1832);
    float _1846 = fma(_1820, _1834, 1.570728778839111328125);
    float _1848 = fma(_1840, 0.5, 0.5);
    float _1850 = sqrt(_1814);
    float _1852 = _1828 * 0.693147182464599609375;
    float _1854 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = _1842 * _1836;
    float _1858 = _1844 * _1836;
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = fma(_1858, -0.5, 0.5);
    float _1864 = _1850 * 0.636619746685028076171875;
    float _1866 = -_1846;
    float _1868 = fma(_1864, _1866, 1.0);
    float3 _5010 = float3(_1860, _1862, _1854);
    float _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).x;
    float3 _5021 = float3(_1860, _1862, _1854);
    float4 _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).xyzw;
    float _1875 = _1873.x;
    float _1877 = _1873.y;
    float _1879 = _1873.z;
    float _1881 = _1873.w;
    float2 _5038 = float2(_1868, _1848);
    float3 _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5038, float2(0.0), isnan(_5038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5038, float2(0.0), isnan(_5038)), level(0.0)).xyz;
    float _1887 = _1885.x;
    float _1889 = _1885.y;
    float _1891 = _1885.z;
    float _1893 = -_896;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _716);
    float _1897 = -_902;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _1901 = -_930;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1905 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1907 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1909 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1907);
    float _1913 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1917 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1919 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1913);
    float _1921 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1923 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1917);
    float _1925 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1927 = 1.0 / _1921;
    bool _1929 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan(0.5);
    bool _1937 = _1933 || _1935;
    float _1939 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1943 = exp2(_1905);
    float _1945 = _1941 + _1921;
    float _1947 = _1945 * _1927;
    float _1949 = _1947 * 0.5;
    float _1951 = _1927;
    if (_1937)
    {
        _1951 = 1.0;
    }
    float _1953 = _1951;
    float _1955 = _1953;
    if (!_1937)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
        float _1963 = _1957 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1967;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1961;
        float _1987 = _1981 * _1983;
        float _1989 = _1971 * 6.283185482025146484375;
        float _1991 = sin(_1989);
        float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1993;
        float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1999 = _1985 * _1997;
        float _2001 = 1.0 / _1987;
        float _2003 = 1.0 / _1995;
        float _2005 = _1991 * _2001;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2009 = fma(_2005, _1999, _2007);
        float _2011 = _2009 * _2003;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        float _2015 = -_2013;
        float _2017 = _2015 + 1.0;
        _1955 = _2017;
    }
    float _2019 = _1955;
    float _2021 = -_1943;
    float _2023 = _2021 + 1.0;
    bool _2025 = _2019 > 0.0;
    bool _2027 = isnan(_2019);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _1925 + _1816;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2041 = _1842 + _1816;
    float _2043 = _1816 * 0.5;
    out.gl_Position.x = _1842;
    out.gl_Position.y = _1844;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1816;
    float _2045 = _2039 * _1870;
    float _2047 = -_2039;
    float _2049 = _2047 + 1.0;
    float _2051 = _2037 * 0.5;
    float _2053 = _1881 * _2045;
    float _2055 = _1891 * _2045;
    float _2057 = _2041 * 0.5;
    float _2059 = fma(_1844, -0.5, _2043);
    float _2061 = fma(_1887, _2053, _1875);
    float _2063 = fma(_1889, _2053, _1877);
    float _2065 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2067 = _1881 * _2049;
    float _2069 = fma(_1881, _2055, _1879);
    out.m_67.x = _2057;
    out.m_67.y = _2059;
    out.m_67.z = _2051;
    out.m_67.w = _1816;
    out.m_47.x = _2065;
    out.m_69.x = _2061;
    out.m_69.y = _2063;
    out.m_69.z = _2069;
    out.m_69.w = _2067;
    if (_2033)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1498 = false;
    bool _1126 = false;
    bool _480 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _90 = int(_88);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2128 = as_type<float>(_106);
        out.gl_Position.z = _2128;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_142);
        out.gl_Position.z = _2196;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = in.m_51.x;
    float _376 = in.m_51.y;
    float _378 = in.m_51.z;
    float _380 = _314 * _352;
    float _382 = _298 * _366;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = fma(_362, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = _392 * _368;
    float _400 = _394 * _368;
    float _402 = _396 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _380, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _380, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _380, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _444 = _434 * _374;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _448 = _436 * _376;
    float _450 = _438 * _378;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _454 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _460 = !_364;
    float _478;
    if (!_460)
    {
        float _462 = in.m_53.x;
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _470 = _468 * _464;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = true;
    }
    else
    {
        float _482 = float(_90);
        float _484 = 1.0 / _482;
        float _486 = _124 * _484;
        _478 = _486;
    }
    _480 = false;
    float _488 = _478;
    float _490 = in.m_53.x;
    float _492 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _494 = in.m_53.w;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _498 = _496 != 0;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _500;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _510 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _512 = 1.0 / _502;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _516 = _514 != 0;
    float _518 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _520 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _492);
    float _522 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _510);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _526 = _488 + _524;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _530 = _528 != 0;
    float _532 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _520);
    float _534 = _430;
    bool _536 = _530;
    if (_498)
    {
        float _538 = in.m_53.z;
        _534 = _538;
    }
    float _540 = _534;
    float _542 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = in.m_55.x;
    float _546 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _546;
    bool _550 = false;
    if (_516)
    {
        bool _552 = _490 > 0.5;
        _550 = _552;
    }
    bool _554 = _550;
    float _556 = _526 * _512;
    float _558 = _490 * 6.283185482025146484375;
    float _560 = in.m_55.y;
    bool _562 = _494 > 0.5;
    bool _564 = _562 && _530;
    float _566 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _518);
    float _568 = _518;
    float _570 = _566;
    if (!_506)
    {
        float _572 = in.m_53.y;
        _568 = _572;
    }
    float _574 = _568;
    float _576 = _558 * 0.15915493667125701904296875;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _580 = _578 != 0;
    float _582 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _584;
    float _588 = _576 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = in.m_59.x;
    float _594 = in.m_59.y;
    float _596 = in.m_59.z;
    float _598 = _582;
    if (_498)
    {
        bool _600 = _540 > 0.5;
        _536 = _600;
    }
    bool _602 = _536;
    float _604 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = 0.0;
    if (!_506)
    {
        float _608 = in.m_53.z;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _614 = _548 * _548;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _618;
    float _622 = fma(_586, _586, _614);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _630 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _632;
    float _636 = -_560;
    float _638 = _636 + 1.0;
    float _640 = _576 * 6.283185482025146484375;
    float _642 = cos(_640);
    float _644 = fma(_620, _556, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _646 = fma(_634, _556, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _648 = _620;
    float _650 = _626;
    int _652 = as_type<int>(_644);
    if (!_506)
    {
        _648 = _574;
    }
    float _654 = _648;
    float _656 = fma(_630, _630, _622);
    float _658 = _564 ? _638 : _560;
    float _660 = fma(_626, _556, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = _590 * _592;
    float _664 = _616 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _666 = _654;
    float _668 = _574;
    int _670 = as_type<int>(_660);
    if (_506)
    {
        float _672 = in.m_53.x;
        float _674 = in.m_53.y;
        _666 = _672;
        _668 = _674;
    }
    float _676 = _666;
    float _678 = _668;
    bool _680 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _682 = isnan(_488);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _694 = fma(_664, _658, -0.5);
    bool _696 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _698 = isnan(_488);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = _610;
    if (!_506)
    {
        _570 = _610;
    }
    float _712 = _570;
    float _714 = _642 * _592;
    float _716 = _532 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = -_662;
    float _720 = fma(_642, _596, _718);
    float _722 = -_708;
    float _724 = _722 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _726 = fma(_590, _596, _714);
    float _728 = -_716;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _712;
    if (!_498)
    {
        _598 = _544;
    }
    float _740 = _598;
    float _742 = _730 * _730;
    float _744 = -_732;
    float _746 = _744 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _748 = _690 * _736;
    float _750 = _740;
    if (!_516)
    {
        _650 = _544;
    }
    float _752 = _650;
    float _754 = fma(_724, _724, _742);
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _758 = _660 * _748;
    float _760 = _752;
    if (_498)
    {
        float _762 = -_544;
        float _764 = _762 + 1.0;
        _670 = as_type<int>(_764);
    }
    int _766 = _670;
    float _768 = fma(_746, _746, _754);
    float _770 = _644 * _748;
    if (_516)
    {
        float _772 = -_544;
        float _774 = _772 + 1.0;
        _652 = as_type<int>(_774);
    }
    int _776 = _652;
    if (_506)
    {
        _738 = _678;
    }
    float _778 = _738;
    float _780 = _646 * _748;
    if (_506)
    {
        _710 = _678;
    }
    float _782 = _710;
    float _784 = rsqrt(_768);
    bool _786 = _678 > 0.5;
    bool _788 = _786 && _580;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _716 + _790;
    if (_498)
    {
        float _794 = _602 ? as_type<float>(_766) : _544;
        _750 = _794;
    }
    float _796 = _750;
    float _798 = -_690;
    float _800 = _798 + 1.0;
    float _802 = _792 * _792;
    if (_516)
    {
        float _804 = _554 ? as_type<float>(_776) : _544;
        _760 = _804;
    }
    float _806 = _760;
    float _808 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].x, _770);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].y, _758);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[123].z, _780);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _708 + _816;
    float _820 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[83].z, _692);
    float _822 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[83].w, _812);
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _826 = _732 + _824;
    float _828 = fma(_818, _818, _802);
    float _830 = _724 * _784;
    float _832 = _730 * _784;
    float _834 = _746 * _784;
    float _836 = fma(_826, _826, _828);
    float _838 = _676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _840 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _842 = sqrt(_656);
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _846 = _832 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _848 = -_840;
    float _850 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[10].y, _848);
    float _852 = -_844;
    float _854 = fma(_838, 2.0, _852);
    float _856 = _830 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _858 = -_846;
    float _860 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[9].y, _858);
    float _862 = _850 * _850;
    float _864 = rsqrt(_836);
    float _866 = -_856;
    float _868 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[8].y, _866);
    float _870 = _778 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = fma(_860, _860, _862);
    float _874 = _788 ? _638 : _560;
    float _876 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _820);
    float _878 = fma(_868, _868, _872);
    float _880 = precise::max(_842, 5.0);
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _884 = _756 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    float _888 = precise::min(_880, 50.0);
    float _890 = rsqrt(_878);
    float _892 = fma(_870, -2.0, _882);
    float _894 = fma(_884, _796, -0.5);
    float _896 = _792 * _864;
    float _898 = -_124;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[81].x, _854);
    float _902 = _818 * _864;
    float _904 = fma(_888, 0.01745335571467876434326171875, 0.174532234668731689453125);
    float _906 = -_896;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _910 = fma(_876, _894, _900);
    float _912 = -_902;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _916 = _904 * 0.15915493667125701904296875;
    float _918 = _908 * _908;
    float _920 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _892);
    float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _924 = _874 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _926 = fma(_914, _914, _918);
    float _928 = _860 * _890;
    float _930 = _826 * _864;
    float _932 = _850 * _890;
    float _934 = _868 * _890;
    float _936 = _928 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _938 = -_930;
    float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _826);
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _944 = _934 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = -_936;
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].y, _946);
    float _950 = fma(_940, _940, _926);
    float _952 = _932 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _954 = -_944;
    float _956 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[10].y, _954);
    float _958 = _948 * _948;
    float _960 = -_920;
    float _962 = fma(_886, _694, _960);
    float _964 = -_952;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[9].y, _964);
    float _968 = _916 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = fma(_956, _956, _958);
    float _974 = _924 * _922;
    float _976 = _806 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _978 = _910 + 0.5;
    float _980 = fma(_966, _966, _972);
    float _982 = _976 * _942;
    float _984 = _916 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _962 + 0.5;
    float _990 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].x, _808);
    float _992 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].y, _810);
    float _994 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].z, _814);
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _726);
    out.m_61.x = _982;
    out.m_61.y = _974;
    out.m_61.z = _978;
    out.m_61.w = _988;
    float _998 = rsqrt(_980);
    float _1000 = _720 * _970;
    float _1002 = sqrt(_950);
    float _1004 = _720 * _986;
    float _1006 = -_1000;
    float _1008 = fma(_986, _594, _1006);
    float _1010 = fma(_970, _594, _1004);
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1014 = _948 * _998;
    float _1016 = _956 * _998;
    float _1018 = _966 * _998;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1010);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = _864 * _1002;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1028 = _542 * _1024;
    float _1030 = _604 * _1024;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1026);
    float _1034 = _612 * _1024;
    float _1036 = _1028 * _1012;
    float _1038 = _1030 * _996;
    float _1040 = abs(_1032);
    float _1042 = -_1040;
    float _1044 = _1042 + 1.0;
    float _1046 = _1034 * _1020;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1050 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1052 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1054 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1048);
    int _1056 = as_type<int>(_1044) + (-218103808);
    float _1058 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1050);
    float _1060 = abs(_1032);
    float _1062 = fma(_1060, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1064 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1052);
    bool _1066 = uint(_1056) >= 1920991232u;
    float _1068 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1058);
    float _1070 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1072 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1074 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1076 = abs(_1032);
    float _1078 = fma(_1076, _1062, -0.212114393711090087890625);
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1054);
    float _1082 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1064);
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = abs(_1032);
    float _1092 = fma(_1090, _1078, 1.570728778839111328125);
    bool _1094 = _1032 < 0.0;
    float _1096 = float(_1094);
    bool _1098 = !_1066;
    float _1100 = _1080;
    float _1102 = _1068;
    float _1124;
    if (!_1098)
    {
        int _1104 = as_type<int>(_996);
        int _1106 = as_type<int>(_1012);
        int _1108 = as_type<int>(_1044);
        int _1110 = 6112;
        int _1112;
        int _1114;
        int _1116;
        int _1118;
        int _1120;
        int _1122;
        _82(_1104, _1106, _1108, _1110, _1112, _1114, _1116, _1118, _1120, _1122, out.gl_Position, out.gl_PointSize);
        _1124 = as_type<float>(_1116);
        _1126 = true;
    }
    else
    {
        float _1128 = rsqrt(_1044);
        float _1130 = _1044 * _1128;
        float _1132 = _1128 * 0.5;
        float _1134 = -_1130;
        float _1136 = 0.0 + _1134;
        float _1138 = fma(_1132, _1136, 0.5);
        float _1140 = fma(_1130, _1138, _1130);
        float _1142 = -_1140;
        float _1144 = 0.0 + _1142;
        float _1146 = fma(_1140, _1144, _1044);
        float _1148 = fma(_1132, _1146, _1140);
        _1124 = _1148;
    }
    _1126 = false;
    float _1150 = _1124;
    float _1152 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1154 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1156 = _1092 * _1150;
    float _1158 = -_1152;
    float _1160 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1158);
    float _1162 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1164 = -_1154;
    float _1166 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1164);
    float _1168 = _1160 * _1160;
    float _1170 = -_1162;
    float _1172 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1174 = _1096 * 2.0;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1178 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1176;
    float _1180 = fma(_1166, _1166, _1168);
    float _1182 = -_1174;
    float _1184 = fma(_1156, _1182, _1156);
    float _1186 = fma(_1172, _1172, _1180);
    float _1188 = fma(_1096, 3.1415927410125732421875, _1184);
    float _1190 = rsqrt(_1186);
    float _1192 = _1188 * 0.15915493667125701904296875;
    float _1194 = _1192 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1160 * _1190;
    float _1200 = _1166 * _1190;
    float _1202 = _1172 * _1190;
    float _1204 = _1198 * _1198;
    float _1206 = fma(_1200, _1200, _1204);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1210 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1208;
    float _1212 = fma(_1202, _1202, _1206);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1216 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1214;
    float _1218 = -_1210;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = rsqrt(_1212);
    float _1224 = -_1216;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1226 * _1226;
    float _1230 = _1192 * 6.283185482025146484375;
    float _1232 = sin(_1230);
    float _1234 = fma(_1220, _1220, _1228);
    float _1236 = -_1178;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = fma(_1238, _1238, _1234);
    float _1242 = _1200 * _1222;
    float _1244 = _1202 * _1222;
    float _1246 = -_1196;
    float _1248 = _1246 + 1.0;
    float _1250 = _1198 * _1222;
    float _1252 = sqrt(_1240);
    float _1254 = _1242 * _1248;
    float _1256 = _1250 * _1248;
    float _1258 = _1244 * _1232;
    float _1260 = _1242 * _1232;
    float _1262 = _1250 * _1232;
    float _1264 = _1244 * _1244;
    float _1266 = -_1258;
    float _1268 = fma(_1250, _1254, _1266);
    float _1270 = fma(_1244, _1256, _1260);
    float _1272 = fma(_1242, _1254, _1196);
    float _1274 = -_1260;
    float _1276 = fma(_1244, _1256, _1274);
    float _1278 = _1068 * _1268;
    float _1280 = -_1262;
    float _1282 = fma(_1244, _1254, _1280);
    float _1284 = _1068 * _1270;
    float _1286 = fma(_1248, _1264, _1196);
    float _1288 = fma(_1080, _1272, _1278);
    float _1290 = fma(_1244, _1254, _1262);
    float _1292 = fma(_1080, _1282, _1284);
    float _1294 = fma(_1252, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1296 = fma(_1250, _1256, _1196);
    float _1298 = fma(_1082, _1290, _1288);
    float _1300 = fma(_1082, _1286, _1292);
    float _1302 = fma(_1250, _1254, _1258);
    float _1304 = precise::max(_1294, 0.3499999940395355224609375);
    float _1306 = _708 + _1298;
    float _1308 = _732 + _1300;
    float _1310 = _1068 * _1296;
    float _1312 = precise::min(_1304, 1.0);
    float _1314 = -_1210;
    float _1316 = _1306 + _1314;
    float _1318 = -_1178;
    float _1320 = _1308 + _1318;
    float _1322 = fma(_1080, _1302, _1310);
    float _1324 = fma(_1316, _1312, _1210);
    float _1326 = fma(_1320, _1312, _1178);
    float _1328 = fma(_1082, _1276, _1322);
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1332 = _1324 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1336 = _1326 + _1334;
    float _1338 = _716 + _1328;
    float _1340 = _1332 * _1332;
    float _1342 = _1336 * _1336;
    float _1344 = -_1216;
    float _1346 = _1338 + _1344;
    float _1348 = _1340 + _1342;
    float _1350 = fma(_1346, _1312, _1216);
    float _1352 = sqrt(_1348);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = _1322;
    float _1358 = _1216;
    float _1360 = _1346;
    float _1362 = _1324;
    if (!_1354)
    {
        _1356 = _1342;
    }
    float _1364 = _1356;
    float _1366 = _1364;
    if (!_1354)
    {
        _1100 = _1340;
    }
    float _1368 = _1100;
    float _1370 = _1368;
    if (!_1354)
    {
        _1358 = _1324;
    }
    float _1372 = _1358;
    float _1374 = _1372;
    if (!_1354)
    {
        _1102 = _1326;
    }
    float _1376 = _1102;
    float _1378 = _1376;
    if (!_1354)
    {
        _1360 = _1350;
    }
    float _1380 = _1360;
    bool _1382 = !_1354;
    float _1384 = _1380;
    if (!_1382)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1390 = _1352 + _1388;
        float _1392 = _1350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = rsqrt(_1348);
        float _1396 = _1390 * _1386;
        float _1398 = _1396 * 0.15915493667125701904296875;
        float _1400 = _1398 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        float _1408 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1394 * _1408;
        float _1412 = _1406 + (-1.0);
        float _1414 = _1336 * _1410;
        float _1416 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = _1332 * _1410;
        float _1420 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1422 = _1414 * _1414;
        float _1424 = fma(_1350, _1406, _1416);
        float _1426 = _1418 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1428 = _1418 * _1418;
        _1384 = _1424;
        _1370 = _1428;
        _1366 = _1422;
        _1374 = _1426;
        _1378 = _1420;
    }
    float _1430 = _1384;
    float _1432 = _1370;
    float _1434 = _1366;
    float _1436 = _1374;
    float _1438 = _1378;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1442 = _1430 + _1440;
    out.m_63.x = _454;
    out.m_63.y = _456;
    out.m_63.z = _458;
    out.m_63.w = _452;
    float _1444 = fma(_1442, _1442, _1432);
    out.m_65.x = _1084;
    out.m_65.y = _1086;
    out.m_65.z = _1088;
    float _1446 = _1444 + _1434;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1452 = isnan(_1448);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1458 = _1454 || _1456;
    float _1460 = _1444;
    float _1462 = _1430;
    if (!_1458)
    {
        _1460 = 1.0;
    }
    float _1464 = _1460;
    bool _1466 = !_1458;
    float _1468 = _1464;
    if (!_1466)
    {
        bool _1470 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1472 = isnan(_1448);
        bool _1474 = _1470 || _1472;
        bool _1476 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1478 = _1474 || _1476;
        if (!_1478)
        {
            float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1482 = _1448 + _1480;
            float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1486 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1484;
            float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1490 = _1488 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1492 = 1.0 / _1486;
            float _1494 = _1482 * _1492;
            float _1496 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1468 = _1496;
            _1498 = true;
        }
        else
        {
            bool _1500 = _1448 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1502 = isnan(_1448);
            bool _1504 = _1500 || _1502;
            bool _1506 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1508 = _1504 || _1506;
            if (!_1508)
            {
                float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1512 = _1448 + _1510;
                float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1516 = _1514 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1520 = _1518 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1522 = 1.0 / _1516;
                float _1524 = _1512 * _1522;
                float _1526 = fma(_1524, _1520, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1468 = _1526;
                _1498 = true;
            }
            else
            {
                _1468 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1498 = false;
    float _1528 = _1468;
    float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1532 = _1430 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1536 = _1436 + _1534;
    float _1538 = fma(_1532, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1542 = _1438 + _1540;
    float _1544 = fma(_1536, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1546 = -_896;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = fma(_1542, _1528, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1552 = -_902;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1544);
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1558 = _1548 + _1556;
    float _1560 = -_930;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1550);
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1566 = _1554 + _1564;
    float _1568 = _1558 * _1558;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1572 = _1562 + _1570;
    float _1574 = fma(_1566, _1566, _1568);
    float _1576 = fma(_1572, _1572, _1574);
    float _1578 = rsqrt(_1576);
    float _1580 = sqrt(_1576);
    float _1582 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1584 = _1566 * _1582;
    float _1586 = _1572 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 * _1586;
    float _1592 = _1588 + _1590;
    float _1594 = sqrt(_1592);
    bool _1596 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1600 = _1594 + _1598;
    float _1602 = _1572;
    float _1604 = _1568;
    float _1606 = _1600;
    float _1608 = _1558;
    float _1610 = _1544;
    float _1612 = _1584;
    if (_1596)
    {
        float _1614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1602 = _1614;
    }
    float _1616 = _1602;
    if (_1596)
    {
        float _1618 = rsqrt(_1592);
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1596)
    {
        float _1624 = _1600 * _1616;
        _1606 = _1624;
    }
    float _1626 = _1606;
    if (_1596)
    {
        float _1628 = _1626 * 0.15915493667125701904296875;
        _1462 = _1628;
    }
    float _1630 = _1462;
    float _1632 = _1578;
    if (_1596)
    {
        float _1634 = _1630 * 6.283185482025146484375;
        float _1636 = sin(_1634);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1642 = precise::max(0.0, _1640);
    float _1644 = _1616;
    float _1646 = _1642;
    if (_1596)
    {
        float _1648 = _1630 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        _1644 = _1650;
    }
    float _1652 = _1644;
    float _1654 = -_1582;
    float _1656 = -_1642;
    float _1658 = fma(_1558, _1654, _1656);
    if (_1596)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1660;
    }
    float _1662 = _1608;
    float _1664 = _1638;
    float _1666 = _1662;
    if (_1596)
    {
        float _1668 = fma(_1638, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = _1670;
    if (!_1596)
    {
        _1666 = _1590;
    }
    float _1674 = _1666;
    float _1676 = _1674;
    if (_1596)
    {
        float _1678 = _1652 + (-1.0);
        _1646 = _1678;
    }
    float _1680 = _1646;
    float _1682 = _1680;
    if (_1596)
    {
        float _1684 = _1620 * _1670;
        _1362 = _1684;
    }
    float _1686 = _1362;
    if (!_1596)
    {
        _1622 = _1658;
    }
    float _1688 = _1622;
    float _1690 = _1688;
    if (_1596)
    {
        float _1692 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1610 = _1692;
    }
    float _1694 = _1610;
    if (_1596)
    {
        float _1696 = _1584 * _1686;
        _1612 = _1696;
    }
    float _1698 = _1612;
    if (!_1596)
    {
        _1672 = _1586;
    }
    float _1700 = _1672;
    float _1702 = _1700;
    if (_1596)
    {
        float _1704 = _1586 * _1686;
        _1702 = _1704;
    }
    float _1706 = _1702;
    if (!_1596)
    {
        _1682 = _1588;
    }
    float _1708 = _1682;
    float _1710 = _1708;
    if (_1596)
    {
        float _1712 = fma(_1658, _1652, _1694);
        _1690 = _1712;
    }
    float _1714 = _1690;
    if (_1596)
    {
        float _1716 = _1698 * _1698;
        _1710 = _1716;
    }
    float _1718 = _1710;
    if (_1596)
    {
        float _1720 = _1706 * _1706;
        _1676 = _1720;
    }
    float _1722 = _1676;
    float _1724 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = fma(_1714, _1714, _1718);
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = _1726 + _1722;
    float _1736 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1740 = -_1732;
    float _1742 = _1740 + 1.0;
    float _1744 = rsqrt(_1734);
    float _1746 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1736);
    float _1748 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1754 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1756 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1760 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = abs(_1742);
    float _1768 = log2(_1766);
    float _1770 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1758);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1776 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1778 = _1744 * _1698;
    float _1780 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = _1744 * _1714;
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1788 = _1744 * _1706;
    float _1790 = -_1776;
    float _1792 = fma(_1790, _1738, 1.0);
    float _1794 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1784);
    float _1796 = -_1786;
    float _1798 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1796);
    float _1800 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1802 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1804 = -_1788;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1798);
    float _1808 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1794);
    float _1810 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = exp2(_1802);
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1808);
    float _1818 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = fma(_1806, 0.5, 0.5);
    float _1822 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1800);
    float _1824 = _1782 + 1.0;
    float _1826 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1828 = log2(_1792);
    float _1830 = fma(_1820, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1832 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1822);
    float _1834 = fma(_1820, _1830, -0.212114393711090087890625);
    float _1836 = 1.0 / _1816;
    float _1838 = -_1782;
    float _1840 = fma(_1812, _1824, _1838);
    float _1842 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1826);
    float _1844 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1832);
    float _1846 = fma(_1820, _1834, 1.570728778839111328125);
    float _1848 = fma(_1840, 0.5, 0.5);
    float _1850 = sqrt(_1814);
    float _1852 = _1828 * 0.693147182464599609375;
    float _1854 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = _1842 * _1836;
    float _1858 = _1844 * _1836;
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = fma(_1858, -0.5, 0.5);
    float _1864 = _1850 * 0.636619746685028076171875;
    float _1866 = -_1846;
    float _1868 = fma(_1864, _1866, 1.0);
    float3 _5010 = float3(_1860, _1862, _1854);
    float _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).x;
    float3 _5021 = float3(_1860, _1862, _1854);
    float4 _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).xyzw;
    float _1875 = _1873.x;
    float _1877 = _1873.y;
    float _1879 = _1873.z;
    float _1881 = _1873.w;
    float2 _5038 = float2(_1868, _1848);
    float3 _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5038, float2(0.0), isnan(_5038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5038, float2(0.0), isnan(_5038)), level(0.0)).xyz;
    float _1887 = _1885.x;
    float _1889 = _1885.y;
    float _1891 = _1885.z;
    float _1893 = -_896;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _716);
    float _1897 = -_902;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _1901 = -_930;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1905 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1907 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1909 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1907);
    float _1913 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1917 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1919 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1913);
    float _1921 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1923 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1917);
    float _1925 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1927 = 1.0 / _1921;
    bool _1929 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan(0.5);
    bool _1937 = _1933 || _1935;
    float _1939 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1943 = exp2(_1905);
    float _1945 = _1941 + _1921;
    float _1947 = _1945 * _1927;
    float _1949 = _1947 * 0.5;
    float _1951 = _1927;
    if (_1937)
    {
        _1951 = 1.0;
    }
    float _1953 = _1951;
    float _1955 = _1953;
    if (!_1937)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
        float _1963 = _1957 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1967;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1961;
        float _1987 = _1981 * _1983;
        float _1989 = _1971 * 6.283185482025146484375;
        float _1991 = sin(_1989);
        float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1993;
        float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1999 = _1985 * _1997;
        float _2001 = 1.0 / _1987;
        float _2003 = 1.0 / _1995;
        float _2005 = _1991 * _2001;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2009 = fma(_2005, _1999, _2007);
        float _2011 = _2009 * _2003;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        float _2015 = -_2013;
        float _2017 = _2015 + 1.0;
        _1955 = _2017;
    }
    float _2019 = _1955;
    float _2021 = -_1943;
    float _2023 = _2021 + 1.0;
    bool _2025 = _2019 > 0.0;
    bool _2027 = isnan(_2019);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _1925 + _1816;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2041 = _1842 + _1816;
    float _2043 = _1816 * 0.5;
    out.gl_Position.x = _1842;
    out.gl_Position.y = _1844;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1816;
    float _2045 = _2039 * _1870;
    float _2047 = -_2039;
    float _2049 = _2047 + 1.0;
    float _2051 = _2037 * 0.5;
    float _2053 = _1881 * _2045;
    float _2055 = _1891 * _2045;
    float _2057 = _2041 * 0.5;
    float _2059 = fma(_1844, -0.5, _2043);
    float _2061 = fma(_1887, _2053, _1875);
    float _2063 = fma(_1889, _2053, _1877);
    float _2065 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2067 = _1881 * _2049;
    float _2069 = fma(_1881, _2055, _1879);
    out.m_67.x = _2057;
    out.m_67.y = _2059;
    out.m_67.z = _2051;
    out.m_67.w = _1816;
    out.m_47.x = _2065;
    out.m_69.x = _2061;
    out.m_69.y = _2063;
    out.m_69.z = _2069;
    out.m_69.w = _2067;
    if (_2033)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


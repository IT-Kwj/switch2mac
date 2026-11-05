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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _284 = false;
    bool _282 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _572 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _589 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _92 * _102;
    float _106 = _68 * _104;
    float _108 = _72 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _94 * _110;
    float _114 = 1.0 / _98;
    float _116 = -_106;
    float _118 = fma(_112, _70, _116);
    float _120 = -_108;
    float _122 = fma(_112, _76, _120);
    float _124 = -_104;
    float _126 = _124 + _112;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _100 * _128;
    float _132 = _118 * _118;
    float _134 = -_106;
    float _136 = fma(_130, _74, _134);
    float _138 = -_108;
    float _140 = fma(_130, _78, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_104;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = _114 * _150;
    float _154 = fma(_126, _126, _142);
    float _156 = fma(_140, _140, _148);
    float _158 = _152 * _72;
    float _160 = -_152;
    bool _164 = _160 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _166 = _152 * _68;
    float _168 = fma(_146, _146, _156);
    float _170 = rsqrt(_154);
    float _172 = -_152;
    bool _174 = _172 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _176 = !_164;
    uint _179 = uint(_176 ? 0 : 1);
    float _181 = rsqrt(_168);
    float _183 = _122 * _170;
    float _185 = _126 * _170;
    float _187 = _118 * _170;
    float _189 = _146 * _181;
    float _191 = _136 * _181;
    float _193 = _140 * _181;
    float _195 = _183 * _189;
    float _197 = _185 * _191;
    float _199 = -_195;
    float _201 = fma(_185, _193, _199);
    float _203 = -_197;
    float _205 = fma(_187, _189, _203);
    float _207 = _187 * _193;
    float _209 = _201 * _201;
    float _211 = -_207;
    float _213 = fma(_183, _191, _211);
    float _215 = fma(_205, _205, _209);
    uint _217 = 2u;
    if (!_164)
    {
        _217 = 1u;
    }
    uint _219 = _217;
    float _221 = fma(_213, _213, _215);
    uint _223 = _219;
    if (!_174)
    {
        _223 = _179;
    }
    uint _225 = _223;
    float _227 = rsqrt(_221);
    uint _229 = min(_225, 2u);
    int _232 = int(_229) << 2;
    float _234 = _201 * _227;
    float _236 = _205 * _227;
    float _238 = _213 * _227;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _242 = uint(int(uint(_232) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].x, _240);
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].z, _250);
    float _254 = abs(_252);
    float _256 = -_254;
    float _258 = _256 + 1.0;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = abs(_260);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_236, _270, _158);
    float _274 = fma(_234, _270, _166);
    float _276 = fma(_238, _270, _152);
    bool _278 = as_type<int>(_248) == 1344;
    if (!_278)
    {
        bool _280 = as_type<int>(_248) == 1616;
        _282 = _280;
        if (!_282)
        {
            _284 = true;
        }
    }
    float _318;
    float _320;
    float _322;
    float _324;
    if (!_282)
    {
        if (!_284)
        {
            float _286 = _274 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _274 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _310;
            _322 = _314;
            _324 = _312;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _350;
            _322 = _354;
            _324 = _352;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _382;
            _322 = _386;
            _324 = _384;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _166 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _400 = float(int(_225));
    float _402 = 1.0 / _390;
    float _404 = _166 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _406 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[15].x, _398);
    float _408 = _166 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _410 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _404);
    float _412 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].z, _406);
    float _414 = rint(_400);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    uint _420 = clamp(_418, 0u, 65535u);
    float _422 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].z, _410);
    float _424 = _412 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _426 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[12].x, _408);
    float _428 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _430 = _422 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _432 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _434 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].z, _426);
    float _436 = 1.0 / _424;
    float _438 = _402 * _392;
    float _440 = _402 * _394;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _434 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _446 = _402 * _396;
    float _448 = fma(_442, _428, _438);
    float _450 = -_432;
    float _452 = fma(_442, _450, _446);
    float _454 = _444 * _436;
    float _456 = -_428;
    float _458 = fma(_442, _456, _438);
    float _460 = fma(_442, _432, _446);
    float _462 = _430 * _436;
    float3 _1321 = float3(_438, _460, float(int(_420)));
    float3 _1325 = select(_1321, float3(0.0), isnan(_1321));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1325.xy, uint(rint(_1325.z)), _442);
    float3 _1334 = float3(_448, _460, float(int(_420)));
    float3 _1336 = select(_1334, float3(0.0), isnan(_1334));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1336.xy, uint(rint(_1336.z)), _442);
    float3 _1345 = float3(_458, _460, float(int(_420)));
    float3 _1347 = select(_1345, float3(0.0), isnan(_1345));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1347.xy, uint(rint(_1347.z)), _442);
    float3 _1356 = float3(_448, _446, float(int(_420)));
    float3 _1358 = select(_1356, float3(0.0), isnan(_1356));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1358.xy, uint(rint(_1358.z)), _442);
    float3 _1367 = float3(_438, _446, float(int(_420)));
    float3 _1369 = select(_1367, float3(0.0), isnan(_1367));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1369.xy, uint(rint(_1369.z)), _442);
    float2 _1375 = float2(_454, _462);
    float2 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1375, float2(0.0), isnan(_1375))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1375, float2(0.0), isnan(_1375))).xy;
    float _478 = _476.x;
    float _480 = _476.y;
    float3 _1390 = float3(_458, _446, float(int(_420)));
    float3 _1392 = select(_1390, float3(0.0), isnan(_1390));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1392.xy, uint(rint(_1392.z)), _442);
    float3 _1401 = float3(_448, _452, float(int(_420)));
    float3 _1403 = select(_1401, float3(0.0), isnan(_1401));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1403.xy, uint(rint(_1403.z)), _442);
    float3 _1412 = float3(_438, _452, float(int(_420)));
    float3 _1414 = select(_1412, float3(0.0), isnan(_1412));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1414.xy, uint(rint(_1414.z)), _442);
    float3 _1423 = float3(_458, _452, float(int(_420)));
    float3 _1425 = select(_1423, float3(0.0), isnan(_1423));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1425.xy, uint(rint(_1425.z)), _442);
    float _490 = _166 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _492 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[14].x, _490);
    float _494 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].z, _492);
    float _496 = _494 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _498 = precise::min(_496, 1.0);
    float _500 = -_152;
    float _502 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _504 = _500 + _502;
    float _506 = -_152;
    float _508 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _510 = _506 + _508;
    float _512 = _504 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = _466 + _464;
    float _518 = -_478;
    float _520 = fma(_518, _478, _480);
    float _522 = -_478;
    float _524 = _498 + _522;
    float _526 = _516 + _468;
    float _528 = fma(_524, _524, _520);
    float _530 = _526 + _470;
    bool _532 = _524 <= 0.001000000047497451305389404296875;
    float _534 = float(_532);
    float _536 = _530 + _472;
    float _538 = 1.0 / _528;
    float _540 = _536 + _482;
    float _542 = _540 + _484;
    float _544 = _520 * _538;
    float _546 = _542 + _486;
    float _548 = _510 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _550 = precise::clamp(_548, 0.0, 1.0);
    float _552 = precise::max(_544, _534);
    float _554 = _546 + _488;
    float _556 = precise::min(_552, 1.0);
    float _558 = fma(_554, 0.111111111938953399658203125, _514);
    float _560 = _556 + _550;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _558;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _560;
    return out;
}


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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
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
    bool _294 = false;
    bool _292 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _493 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _510 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_510, float2(0.0), isnan(_510))).x;
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
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _72 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _70, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
    float _136 = fma(_116, _116, _126);
    float _138 = -_100;
    float _140 = _138 + _124;
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _136);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_140, _140, _146);
    float _150 = rsqrt(_144);
    float _152 = rsqrt(_148);
    float _154 = -_66;
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _158 = 1.0 / _156;
    float _160 = _116 * _150;
    float _162 = _120 * _150;
    float _164 = _112 * _150;
    float _166 = _140 * _152;
    float _168 = _130 * _152;
    float _170 = _134 * _152;
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_172;
    float _180 = fma(_162, _170, _178);
    float _182 = -_174;
    float _184 = fma(_164, _166, _182);
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _188 = _158 * _186;
    float _190 = -_176;
    float _192 = fma(_160, _168, _190);
    float _194 = _180 * _180;
    float _196 = -_188;
    bool _200 = _196 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _202 = fma(_184, _184, _194);
    float _204 = -_188;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _208 = -_188;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _212 = fma(_192, _192, _202);
    bool _214 = !_200;
    int _217 = _214 ? 0 : 1;
    float _219 = rsqrt(_212);
    int _221 = 2;
    if (!_200)
    {
        _221 = 1;
    }
    int _223 = _221;
    int _225 = _223;
    if (!_206)
    {
        _225 = _217;
    }
    int _227 = _225;
    int _229 = _227 + 1;
    uint _232 = uint(_229);
    if (!_210)
    {
        _232 = uint(_227);
    }
    uint _234 = _232;
    float _236 = _180 * _219;
    float _238 = _184 * _219;
    uint _240 = min(_234, 2u);
    float _242 = _192 * _219;
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _246 = int(_240) << 2;
    float _248 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    uint _250 = uint(int(uint(_246) >> uint(2)));
    uint _252 = uint(int(uint(int(_250)) >> uint(2)));
    int _254 = int(_250) & 3;
    float _256 = (*spvDescriptorSet0.fp_c1)._m0[int(_252)][_254];
    float _258 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _260 = abs(_258);
    float _262 = -_260;
    float _264 = _262 + 1.0;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = abs(_266);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = _238 * _276;
    float _280 = _236 * _276;
    float _282 = fma(_242, _276, _188);
    float _284 = fma(_188, _72, _278);
    float _286 = fma(_188, _68, _280);
    bool _288 = as_type<int>(_256) == 1392;
    if (!_288)
    {
        bool _290 = as_type<int>(_256) == 1664;
        _292 = _290;
        if (!_292)
        {
            _294 = true;
        }
    }
    float _328;
    float _330;
    float _332;
    float _334;
    if (!_292)
    {
        if (!_294)
        {
            float _296 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _298 = _286 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _300 = _286 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _302 = _286 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _304 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
            float _306 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].x, _298);
            float _308 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[2].x, _300);
            float _310 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[3].x, _302);
            float _312 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].z, _304);
            float _314 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].z, _306);
            float _316 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].z, _308);
            float _318 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].z, _310);
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _328 = _326;
            _330 = _324;
            _332 = _320;
            _334 = _322;
        }
    }
    if ((false || _294) || _292)
    {
        if ((!_294) || _292)
        {
            _292 = false;
            float _336 = _286 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _338 = _286 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _340 = _286 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _342 = _286 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _344 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[4].x, _336);
            float _346 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[5].x, _338);
            float _348 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].x, _340);
            float _350 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[7].x, _342);
            float _352 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].z, _344);
            float _354 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].z, _346);
            float _356 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].z, _348);
            float _358 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].z, _350);
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _328 = _366;
            _330 = _364;
            _332 = _360;
            _334 = _362;
        }
        if (false || _294)
        {
            _294 = false;
            float _368 = _286 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _370 = _286 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _372 = _286 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _374 = _286 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _376 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[8].x, _368);
            float _378 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[9].x, _370);
            float _380 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[10].x, _372);
            float _382 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[11].x, _374);
            float _384 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].z, _376);
            float _386 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].z, _378);
            float _388 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].z, _380);
            float _390 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].z, _382);
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _328 = _398;
            _330 = _396;
            _332 = _392;
            _334 = _394;
        }
    }
    float _400 = _328;
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = 1.0 / _400;
    float _410 = float(int(_234));
    float _412 = rint(_410);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    uint _418 = clamp(_416, 0u, 65535u);
    float _420 = _408 * _402;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _408 * _404;
    float _426 = _408 * _406;
    float _428 = _422 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _430 = _428 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _432 = _428 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _434 = fma(_430, 0.5, _424);
    float _436 = fma(_430, -0.5, _424);
    float _438 = fma(_432, 0.5, _426);
    float _440 = fma(_432, -0.5, _426);
    float3 _1189 = float3(_436, _438, float(int(_418)));
    float3 _1193 = select(_1189, float3(0.0), isnan(_1189));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1193.xy, uint(rint(_1193.z)), _422);
    float3 _1202 = float3(_434, _438, float(int(_418)));
    float3 _1204 = select(_1202, float3(0.0), isnan(_1202));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1204.xy, uint(rint(_1204.z)), _422);
    float3 _1213 = float3(_434, _440, float(int(_418)));
    float3 _1215 = select(_1213, float3(0.0), isnan(_1213));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1215.xy, uint(rint(_1215.z)), _422);
    float3 _1224 = float3(_436, _440, float(int(_418)));
    float3 _1226 = select(_1224, float3(0.0), isnan(_1224));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1226.xy, uint(rint(_1226.z)), _422);
    float2 _1232 = float2(_52, _54);
    float _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1232, float2(0.0), isnan(_1232))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1232, float2(0.0), isnan(_1232))).x;
    float _452 = -_188;
    float _454 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _456 = _452 + _454;
    float _458 = _444 + _442;
    float _460 = -_188;
    float _462 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _464 = _460 + _462;
    float _466 = _456 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _464 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = _458 + _446;
    float _476 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[48].w, _468);
    float _478 = _474 + _448;
    float _480 = fma(_478, 0.25, _472);
    out.m_45.x = _450;
    out.m_45.y = _480;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _476;
    return out;
}


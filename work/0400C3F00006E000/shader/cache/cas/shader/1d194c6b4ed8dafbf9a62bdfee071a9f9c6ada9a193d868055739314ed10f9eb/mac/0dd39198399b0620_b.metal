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
    bool _284 = false;
    bool _282 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _483 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _500 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).x;
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
    float _158 = _116 * _150;
    float _160 = _120 * _150;
    float _162 = _112 * _150;
    float _164 = 1.0 / _156;
    float _166 = _140 * _152;
    float _168 = _130 * _152;
    float _170 = _134 * _152;
    float _172 = _158 * _166;
    float _174 = _160 * _168;
    float _176 = -_172;
    float _178 = fma(_160, _170, _176);
    float _180 = _162 * _170;
    float _182 = -_174;
    float _184 = fma(_162, _166, _182);
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _188 = _164 * _186;
    float _190 = _178 * _178;
    float _192 = -_180;
    float _194 = fma(_158, _168, _192);
    float _196 = fma(_184, _184, _190);
    float _198 = -_188;
    bool _202 = _198 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _204 = -_188;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _208 = fma(_194, _194, _196);
    bool _210 = !_202;
    uint _213 = uint(_210 ? 0 : 1);
    float _215 = rsqrt(_208);
    uint _217 = 2u;
    if (!_202)
    {
        _217 = 1u;
    }
    uint _219 = _217;
    uint _221 = _219;
    if (!_206)
    {
        _221 = _213;
    }
    uint _223 = _221;
    uint _225 = min(_223, 2u);
    float _227 = _178 * _215;
    float _229 = _184 * _215;
    float _231 = _194 * _215;
    int _234 = int(_225) << 2;
    float _236 = _227 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _238 = uint(int(uint(_234) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[35].x, _236);
    float _248 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = _229 * _266;
    float _270 = _227 * _266;
    float _272 = fma(_231, _266, _188);
    float _274 = fma(_188, _72, _268);
    float _276 = fma(_188, _68, _270);
    bool _278 = as_type<int>(_244) == 1344;
    if (!_278)
    {
        bool _280 = as_type<int>(_244) == 1616;
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
            float _286 = _276 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _276 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _276 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _314;
            _322 = _310;
            _324 = _312;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _276 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _276 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _276 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _276 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _354;
            _322 = _350;
            _324 = _352;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _276 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _276 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _276 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _276 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _386;
            _322 = _382;
            _324 = _384;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = 1.0 / _390;
    float _400 = float(int(_223));
    float _402 = rint(_400);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    uint _408 = clamp(_406, 0u, 65535u);
    float _410 = _398 * _392;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _398 * _394;
    float _416 = _398 * _396;
    float _418 = _412 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _420 = _418 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _422 = _418 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _424 = fma(_420, 0.5, _414);
    float _426 = fma(_420, -0.5, _414);
    float _428 = fma(_422, 0.5, _416);
    float _430 = fma(_422, -0.5, _416);
    float3 _1163 = float3(_426, _428, float(int(_408)));
    float3 _1167 = select(_1163, float3(0.0), isnan(_1163));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1167.xy, uint(rint(_1167.z)), _412);
    float3 _1176 = float3(_424, _428, float(int(_408)));
    float3 _1178 = select(_1176, float3(0.0), isnan(_1176));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1178.xy, uint(rint(_1178.z)), _412);
    float3 _1187 = float3(_424, _430, float(int(_408)));
    float3 _1189 = select(_1187, float3(0.0), isnan(_1187));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1189.xy, uint(rint(_1189.z)), _412);
    float3 _1198 = float3(_426, _430, float(int(_408)));
    float3 _1200 = select(_1198, float3(0.0), isnan(_1198));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1200.xy, uint(rint(_1200.z)), _412);
    float2 _1206 = float2(_52, _54);
    float _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1206, float2(0.0), isnan(_1206))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1206, float2(0.0), isnan(_1206))).x;
    float _442 = -_188;
    float _444 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _446 = _442 + _444;
    float _448 = _434 + _432;
    float _450 = -_188;
    float _452 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _454 = _450 + _452;
    float _456 = _446 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = _454 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = _448 + _436;
    float _466 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[48].w, _458);
    float _468 = _464 + _438;
    float _470 = fma(_468, 0.25, _462);
    out.m_45.x = _440;
    out.m_45.y = _470;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _466;
    return out;
}


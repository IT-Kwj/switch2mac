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
    bool _278 = false;
    bool _276 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _499 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _516 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = rsqrt(_134);
    float _140 = rsqrt(_136);
    float _142 = _112 * _138;
    float _144 = _124 * _138;
    float _146 = _104 * _138;
    float _148 = _128 * _140;
    float _150 = _108 * _140;
    float _152 = _116 * _140;
    float _154 = _142 * _148;
    float _156 = _144 * _150;
    float _158 = -_154;
    float _160 = fma(_144, _152, _158);
    float _162 = _146 * _152;
    float _164 = -_156;
    float _166 = fma(_146, _148, _164);
    float _168 = -_66;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _172 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[46].z, _170);
    float _174 = _160 * _160;
    float _176 = -_162;
    float _178 = fma(_142, _150, _176);
    float _180 = fma(_166, _166, _174);
    float _182 = -_172;
    bool _186 = _182 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _188 = -_172;
    bool _190 = _188 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _192 = fma(_178, _178, _180);
    float _194 = -_172;
    bool _196 = _194 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _198 = !_186;
    int _201 = _198 ? 0 : 1;
    float _203 = rsqrt(_192);
    int _205 = 2;
    if (!_186)
    {
        _205 = 1;
    }
    int _207 = _205;
    int _209 = _207;
    if (!_190)
    {
        _209 = _201;
    }
    int _211 = _209;
    int _213 = _211 + 1;
    uint _216 = uint(_213);
    if (!_196)
    {
        _216 = uint(_211);
    }
    uint _218 = _216;
    float _220 = _160 * _203;
    float _222 = _166 * _203;
    uint _224 = min(_218, 2u);
    float _226 = _178 * _203;
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _230 = int(_224) << 2;
    float _232 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _234 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _232);
    uint _236 = uint(int(uint(_230) >> uint(2)));
    uint _238 = uint(int(uint(int(_236)) >> uint(2)));
    int _240 = int(_236) & 3;
    float _242 = (*spvDescriptorSet0.fp_c1)._m0[int(_238)][_240];
    float _244 = abs(_234);
    float _246 = -_244;
    float _248 = _246 + 1.0;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = abs(_250);
    float _254 = log2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _258 = exp2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _262 = _220 * _260;
    float _264 = _222 * _260;
    float _266 = fma(_226, _260, _172);
    float _268 = fma(_172, _68, _262);
    float _270 = fma(_172, _70, _264);
    bool _272 = as_type<int>(_242) == 1264;
    if (!_272)
    {
        bool _274 = as_type<int>(_242) == 1536;
        _276 = _274;
        if (!_276)
        {
            _278 = true;
        }
    }
    float _312;
    float _314;
    float _316;
    float _318;
    if (!_276)
    {
        if (!_278)
        {
            float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _282 = _268 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _284 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _286 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _288 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
            float _290 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _282);
            float _292 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _284);
            float _294 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _286);
            float _296 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
            float _298 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
            float _300 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].z, _292);
            float _302 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].z, _294);
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _312 = _310;
            _314 = _308;
            _316 = _306;
            _318 = _304;
        }
    }
    if ((false || _278) || _276)
    {
        if ((!_278) || _276)
        {
            _276 = false;
            float _320 = _268 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _322 = _268 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _324 = _268 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _326 = _268 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _328 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].x, _320);
            float _330 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].x, _322);
            float _332 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].x, _324);
            float _334 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].x, _326);
            float _336 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].z, _328);
            float _338 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].z, _330);
            float _340 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].z, _332);
            float _342 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].z, _334);
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _312 = _350;
            _314 = _348;
            _316 = _346;
            _318 = _344;
        }
        if (false || _278)
        {
            _278 = false;
            float _352 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _354 = _268 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _356 = _268 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _358 = _268 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _360 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x, _352);
            float _362 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].x, _354);
            float _364 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].x, _356);
            float _366 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].x, _358);
            float _368 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].z, _360);
            float _370 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].z, _362);
            float _372 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].z, _364);
            float _374 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].z, _366);
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _312 = _382;
            _314 = _380;
            _316 = _378;
            _318 = _376;
        }
    }
    float _384 = _312;
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = float(int(_218));
    float _394 = 1.0 / _384;
    float _396 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _398 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _400 = rint(_392);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = _394 * _386;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _394 * _388;
    float _414 = _394 * _390;
    float _416 = fma(_410, _398, _412);
    float _418 = fma(_410, _396, _414);
    float _420 = -_396;
    float _422 = fma(_410, _420, _414);
    float _424 = -_398;
    float _426 = fma(_410, _424, _412);
    float3 _1183 = float3(_414, _416, float(int(_406)));
    float3 _1187 = select(_1183, float3(0.0), isnan(_1183));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1187.xy, uint(rint(_1187.z)), _410);
    float3 _1196 = float3(_418, _416, float(int(_406)));
    float3 _1198 = select(_1196, float3(0.0), isnan(_1196));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1198.xy, uint(rint(_1198.z)), _410);
    float3 _1207 = float3(_422, _416, float(int(_406)));
    float3 _1209 = select(_1207, float3(0.0), isnan(_1207));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1209.xy, uint(rint(_1209.z)), _410);
    float3 _1218 = float3(_418, _412, float(int(_406)));
    float3 _1220 = select(_1218, float3(0.0), isnan(_1218));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1220.xy, uint(rint(_1220.z)), _410);
    float3 _1229 = float3(_414, _412, float(int(_406)));
    float3 _1231 = select(_1229, float3(0.0), isnan(_1229));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1231.xy, uint(rint(_1231.z)), _410);
    float3 _1240 = float3(_422, _412, float(int(_406)));
    float3 _1242 = select(_1240, float3(0.0), isnan(_1240));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1242.xy, uint(rint(_1242.z)), _410);
    float3 _1251 = float3(_418, _426, float(int(_406)));
    float3 _1253 = select(_1251, float3(0.0), isnan(_1251));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1253.xy, uint(rint(_1253.z)), _410);
    float3 _1262 = float3(_414, _426, float(int(_406)));
    float3 _1264 = select(_1262, float3(0.0), isnan(_1262));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1264.xy, uint(rint(_1264.z)), _410);
    float3 _1273 = float3(_422, _426, float(int(_406)));
    float3 _1275 = select(_1273, float3(0.0), isnan(_1273));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1275.xy, uint(rint(_1275.z)), _410);
    float2 _1281 = float2(_52, _54);
    float _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1281, float2(0.0), isnan(_1281))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1281, float2(0.0), isnan(_1281))).x;
    float _448 = -_172;
    float _450 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _452 = _448 + _450;
    float _454 = _430 + _428;
    float _456 = _454 + _432;
    float _458 = _456 + _434;
    float _460 = _458 + _436;
    float _462 = _460 + _438;
    float _464 = _462 + _440;
    float _466 = _464 + _442;
    float _468 = -_172;
    float _470 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _472 = _468 + _470;
    float _474 = _472 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _476 = precise::clamp(_474, 0.0, 1.0);
    float _478 = _466 + _444;
    float _480 = _452 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = fma(_478, 0.111111111938953399658203125, _476);
    float _486 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[48].w, _482);
    out.m_45.x = _446;
    out.m_45.y = _484;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _486;
    return out;
}


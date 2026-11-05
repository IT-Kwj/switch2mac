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
    float2 _477 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _494 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = _68 * _84;
    float _94 = _72 * _84;
    float _96 = -_92;
    float _98 = fma(_90, _70, _96);
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_94;
    float _108 = fma(_90, _76, _106);
    float _110 = -_84;
    float _112 = _110 + _90;
    float _114 = _98 * _98;
    float _116 = -_92;
    float _118 = fma(_104, _74, _116);
    float _120 = -_94;
    float _122 = fma(_104, _78, _120);
    float _124 = -_84;
    float _126 = _124 + _104;
    float _128 = fma(_108, _108, _114);
    float _130 = _118 * _118;
    float _132 = fma(_112, _112, _128);
    float _134 = fma(_122, _122, _130);
    float _136 = fma(_126, _126, _134);
    float _138 = rsqrt(_132);
    float _140 = rsqrt(_136);
    float _142 = _108 * _138;
    float _144 = _112 * _138;
    float _146 = _98 * _138;
    float _148 = _126 * _140;
    float _150 = _122 * _140;
    float _152 = _118 * _140;
    float _154 = -_66;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _158 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[46].z, _156);
    float _160 = _142 * _148;
    float _162 = _144 * _152;
    float _164 = -_160;
    float _166 = fma(_144, _150, _164);
    float _168 = _146 * _150;
    float _170 = -_162;
    float _172 = fma(_146, _148, _170);
    float _174 = -_158;
    bool _178 = _174 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _180 = _166 * _166;
    float _182 = -_168;
    float _184 = fma(_142, _152, _182);
    float _186 = -_158;
    bool _188 = _186 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _190 = fma(_172, _172, _180);
    float _192 = -_158;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _196 = !_178;
    int _199 = _196 ? 0 : 1;
    float _201 = fma(_184, _184, _190);
    int _203 = 2;
    if (!_178)
    {
        _203 = 1;
    }
    int _205 = _203;
    float _207 = rsqrt(_201);
    int _209 = _205;
    if (!_188)
    {
        _209 = _199;
    }
    int _211 = _209;
    int _213 = _211 + 1;
    uint _216 = uint(_213);
    if (!_194)
    {
        _216 = uint(_211);
    }
    uint _218 = _216;
    uint _220 = min(_218, 2u);
    int _222 = int(_220) << 2;
    float _224 = _166 * _207;
    float _226 = _172 * _207;
    float _228 = _184 * _207;
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _232 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].x, _230);
    float _234 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[35].z, _232);
    uint _236 = uint(int(uint(_222) >> uint(2)));
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
    float _262 = _226 * _260;
    float _264 = _224 * _260;
    float _266 = fma(_228, _260, _158);
    float _268 = fma(_158, _72, _262);
    float _270 = fma(_158, _68, _264);
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
            float _280 = _270 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _282 = _270 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _284 = _270 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _286 = _270 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _288 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
            float _290 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _282);
            float _292 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _284);
            float _294 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _286);
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
            _316 = _304;
            _318 = _306;
        }
    }
    if ((false || _278) || _276)
    {
        if ((!_278) || _276)
        {
            _276 = false;
            float _320 = _270 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _322 = _270 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _324 = _270 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _326 = _270 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _328 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].x, _320);
            float _330 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].x, _322);
            float _332 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].x, _324);
            float _334 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].x, _326);
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
            _316 = _344;
            _318 = _346;
        }
        if (false || _278)
        {
            _278 = false;
            float _352 = _270 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _354 = _270 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _356 = _270 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _358 = _270 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _360 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x, _352);
            float _362 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].x, _354);
            float _364 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].x, _356);
            float _366 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].x, _358);
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
            _316 = _376;
            _318 = _378;
        }
    }
    float _384 = _312;
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = 1.0 / _384;
    float _394 = float(int(_218));
    float _396 = rint(_394);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    uint _402 = clamp(_400, 0u, 65535u);
    float _404 = _392 * _386;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = _392 * _388;
    float _410 = _392 * _390;
    float _412 = _406 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _414 = _412 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _416 = _412 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _418 = fma(_414, 0.5, _408);
    float _420 = fma(_414, -0.5, _408);
    float _422 = fma(_416, 0.5, _410);
    float _424 = fma(_416, -0.5, _410);
    float3 _1157 = float3(_420, _422, float(int(_402)));
    float3 _1161 = select(_1157, float3(0.0), isnan(_1157));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1161.xy, uint(rint(_1161.z)), _406);
    float3 _1170 = float3(_418, _422, float(int(_402)));
    float3 _1172 = select(_1170, float3(0.0), isnan(_1170));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1172.xy, uint(rint(_1172.z)), _406);
    float3 _1181 = float3(_418, _424, float(int(_402)));
    float3 _1183 = select(_1181, float3(0.0), isnan(_1181));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1183.xy, uint(rint(_1183.z)), _406);
    float3 _1192 = float3(_420, _424, float(int(_402)));
    float3 _1194 = select(_1192, float3(0.0), isnan(_1192));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1194.xy, uint(rint(_1194.z)), _406);
    float2 _1200 = float2(_52, _54);
    float _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1200, float2(0.0), isnan(_1200))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1200, float2(0.0), isnan(_1200))).x;
    float _436 = -_158;
    float _438 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _440 = _436 + _438;
    float _442 = _428 + _426;
    float _444 = -_158;
    float _446 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _448 = _444 + _446;
    float _450 = _440 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = _448 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = _442 + _430;
    float _460 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[48].w, _452);
    float _462 = _458 + _432;
    float _464 = fma(_462, 0.25, _456);
    out.m_45.x = _434;
    out.m_45.y = _464;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _460;
    return out;
}


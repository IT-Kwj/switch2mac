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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1121, thread const int& _1122, constant _10& support_buffer)
{
    int _1125 = 1 + _1122;
    float _1127 = support_buffer._m5[_1125].x;
    float _1129 = abs(_1127);
    bool _1131 = _1129 == 1.0;
    if (_1131)
    {
        return _1121;
    }
    float _1133 = float(_1121);
    float _1135 = _1133 / _1129;
    int _1137 = int(_1135);
    return _1137;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _500 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).x;
    bool _72 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_72)
    {
        discard_fragment();
    }
    float2 _520 = float2(_64, _66);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_520, float2(0.0), isnan(_520))).x;
    if (_72)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _76 = in.m_38.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_38.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::max(_74, _96);
    float _104 = _62 * _80;
    float _106 = precise::max(_102, _104);
    bool _108 = _106 != 0.0;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    float _118 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _62 * _86;
    float _124 = _62 * _92;
    float _126 = precise::min(_100, _120);
    bool _128 = !_116;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_106, _130, 1.0);
        float _134 = log2(_132);
        float _136 = _134 + (-1.0);
        float _138 = trunc(_136);
        int _140 = int(_138);
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _144 = _142;
        int _146 = 2;
        int _148 = _44(_144, _146, (*spvDescriptorSet0.support_buffer));
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _152 = _150;
        int _154 = 2;
        int _156 = _44(_152, _154, (*spvDescriptorSet0.support_buffer));
        float _158 = float(_148);
        float _160 = float(_156);
        float _162 = fma(_64, _158, -0.5);
        float _164 = fma(_66, _160, -0.5);
        float _166 = 1.0 / _158;
        float _168 = floor(_162);
        float _170 = floor(_164);
        float _172 = -_168;
        float _174 = _162 + _172;
        float _176 = -_174;
        float _178 = _176 + 1.0;
        float _180 = -_174;
        float _182 = _180 + 2.0;
        float _184 = -_170;
        float _186 = _164 + _184;
        float _188 = _178 * _178;
        float _190 = _182 * _182;
        float _192 = -_186;
        float _194 = _192 + 1.0;
        float _196 = _178 * _188;
        float _198 = -_186;
        float _200 = _198 + 2.0;
        float _202 = _194 * _194;
        float _204 = -_196;
        float _206 = _204 + 6.0;
        float _208 = _200 * _200;
        float _210 = _194 * _202;
        float _212 = _196 * 4.0;
        float _214 = _210 * 4.0;
        float _216 = -_212;
        float _218 = fma(_182, _190, _216);
        float _220 = -_210;
        float _222 = _220 + 6.0;
        float _224 = 1.0 / _160;
        float _226 = -_214;
        float _228 = fma(_200, _208, _226);
        float _230 = _196 + _218;
        float _232 = -_218;
        float _234 = _232 + _206;
        float _236 = _218 * 0.16666667163372039794921875;
        float _238 = _210 + _228;
        float _240 = -_228;
        float _242 = _240 + _222;
        float _244 = _230 * 0.16666667163372039794921875;
        float _246 = _234 * 0.16666667163372039794921875;
        float _248 = _238 * 0.16666667163372039794921875;
        float _250 = _242 * 0.16666667163372039794921875;
        float _252 = 1.0 / _244;
        float _254 = _174 * _174;
        float _256 = _186 * _186;
        float _258 = _228 * 0.16666667163372039794921875;
        float _260 = _174 * _254;
        float _262 = _186 * _256;
        float _264 = _170 + (-0.5);
        float _266 = 1.0 / _248;
        float _268 = _168 + (-0.5);
        float _270 = _168 + 1.5;
        float _272 = _170 + 1.5;
        float _274 = _260 * 0.16666667163372039794921875;
        float _276 = _262 * 0.16666667163372039794921875;
        float _278 = 1.0 / _246;
        float _280 = fma(_236, _252, _268);
        float _282 = 1.0 / _250;
        float _284 = fma(_258, _266, _264);
        float _286 = _284 * _224;
        float _288 = fma(_274, _278, _270);
        float _290 = _280 * _166;
        float _292 = _288 * _166;
        float _294 = fma(_276, _282, _272);
        float _296 = _294 * _224;
        float2 _828 = float2(_290, _286);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_828, float2(0.0), isnan(_828)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_828, float2(0.0), isnan(_828)), level(_136)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _843 = float2(_292, _286);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_843, float2(0.0), isnan(_843)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_843, float2(0.0), isnan(_843)), level(_136)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _858 = float2(_290, _296);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_858, float2(0.0), isnan(_858)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_858, float2(0.0), isnan(_858)), level(_136)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _873 = float2(_292, _296);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_873, float2(0.0), isnan(_873)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_873, float2(0.0), isnan(_873)), level(_136)).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = -_312;
        float _334 = _304 + _332;
        float _336 = -_310;
        float _338 = _302 + _336;
        float _340 = -_328;
        float _342 = _320 + _340;
        float _344 = -_326;
        float _346 = _318 + _344;
        float _348 = fma(_244, _334, _312);
        float _350 = fma(_244, _338, _310);
        float _352 = fma(_244, _342, _328);
        float _354 = -_314;
        float _356 = _306 + _354;
        float _358 = -_330;
        float _360 = _322 + _358;
        float _362 = fma(_244, _346, _326);
        float _364 = -_352;
        float _366 = _364 + _348;
        float _368 = fma(_244, _356, _314);
        float _370 = fma(_244, _360, _330);
        float _372 = -_362;
        float _374 = _372 + _350;
        float _376 = fma(_248, _366, _352);
        float _378 = 0.0 + _134;
        float _380 = precise::clamp(_378, 0.0, 1.0);
        float _382 = -_370;
        float _384 = _382 + _368;
        float _386 = fma(_248, _374, _362);
        float _388 = _376 * 0.586600005626678466796875;
        float _390 = _126 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _392 = fma(_248, _384, _370);
        float _394 = fma(_124, _380, _122);
        float _396 = fma(_386, 0.29890000820159912109375, _388);
        float _398 = fma(_392, 0.1143999993801116943359375, _396);
        float _400 = -_386;
        float _402 = _400 + _398;
        float _404 = -_376;
        float _406 = _404 + _398;
        float _408 = -_392;
        float _410 = _408 + _398;
        float _412 = fma(_390, _402, _386);
        float _414 = fma(_390, _406, _376);
        float _416 = fma(_390, _410, _392);
        float _418 = -_412;
        float _420 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[13].x, _418);
        float _422 = -_414;
        float _424 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[13].y, _422);
        float _426 = -_416;
        float _428 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[13].z, _426);
        float _430 = 1.0 / _394;
        float _432 = fma(_126, _420, _412);
        float _434 = fma(_126, _424, _414);
        float _436 = fma(_126, _428, _416);
        float _438 = _380 * _432;
        float _440 = _380 * _434;
        float _442 = _380 * _436;
        float _444 = -_438;
        float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _448 = -_440;
        float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _452 = -_442;
        float _454 = _452 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _456 = fma(_122, _446, _438);
        float _458 = fma(_122, _450, _440);
        float _460 = fma(_122, _454, _442);
        float _462 = _456 * _430;
        float _464 = _458 * _430;
        float _466 = _460 * _430;
        out.m_36.x = _462;
        out.m_36.y = _464;
        out.m_36.z = _466;
        out.m_36.w = _394;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _122;
    return out;
}


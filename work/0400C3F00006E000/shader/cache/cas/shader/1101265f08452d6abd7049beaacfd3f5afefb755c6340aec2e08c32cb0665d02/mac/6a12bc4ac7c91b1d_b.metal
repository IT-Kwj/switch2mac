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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1105, thread const int& _1106, constant _10& support_buffer)
{
    int _1109 = 1 + _1106;
    float _1111 = support_buffer._m5[_1109].x;
    float _1113 = abs(_1111);
    bool _1115 = _1113 == 1.0;
    if (_1115)
    {
        return _1105;
    }
    float _1117 = float(_1105);
    float _1119 = _1117 / _1113;
    int _1121 = int(_1119);
    return _1121;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _498 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = -_66;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _96 = 1.0 / _94;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::max(_100, _90);
    float _104 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    bool _110 = _102 != 0.0;
    bool _112 = isnan(_102);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    float _120 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = precise::min(_122, _106);
    bool _126 = !_118;
    if (!_126)
    {
        float _128 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _130 = fma(_102, _128, 1.0);
        float _132 = log2(_130);
        float _134 = _132 + (-1.0);
        float _136 = trunc(_134);
        int _138 = int(_136);
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        float _156 = float(_146);
        float _158 = float(_154);
        float _160 = fma(_62, _156, -0.5);
        float _162 = fma(_64, _158, -0.5);
        float _164 = 1.0 / _156;
        float _166 = floor(_160);
        float _168 = floor(_162);
        float _170 = -_166;
        float _172 = _160 + _170;
        float _174 = -_172;
        float _176 = _174 + 1.0;
        float _178 = -_172;
        float _180 = _178 + 2.0;
        float _182 = -_168;
        float _184 = _162 + _182;
        float _186 = _176 * _176;
        float _188 = _180 * _180;
        float _190 = -_184;
        float _192 = _190 + 1.0;
        float _194 = _176 * _186;
        float _196 = -_184;
        float _198 = _196 + 2.0;
        float _200 = _192 * _192;
        float _202 = -_194;
        float _204 = _202 + 6.0;
        float _206 = _198 * _198;
        float _208 = _192 * _200;
        float _210 = _194 * 4.0;
        float _212 = _208 * 4.0;
        float _214 = -_210;
        float _216 = fma(_180, _188, _214);
        float _218 = -_208;
        float _220 = _218 + 6.0;
        float _222 = 1.0 / _158;
        float _224 = -_212;
        float _226 = fma(_198, _206, _224);
        float _228 = _194 + _216;
        float _230 = -_216;
        float _232 = _230 + _204;
        float _234 = _216 * 0.16666667163372039794921875;
        float _236 = _208 + _226;
        float _238 = -_226;
        float _240 = _238 + _220;
        float _242 = _228 * 0.16666667163372039794921875;
        float _244 = _232 * 0.16666667163372039794921875;
        float _246 = _236 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = 1.0 / _242;
        float _252 = _172 * _172;
        float _254 = _184 * _184;
        float _256 = _226 * 0.16666667163372039794921875;
        float _258 = _172 * _252;
        float _260 = _184 * _254;
        float _262 = _168 + (-0.5);
        float _264 = 1.0 / _246;
        float _266 = _166 + (-0.5);
        float _268 = _166 + 1.5;
        float _270 = _168 + 1.5;
        float _272 = _258 * 0.16666667163372039794921875;
        float _274 = _260 * 0.16666667163372039794921875;
        float _276 = 1.0 / _244;
        float _278 = fma(_234, _250, _266);
        float _280 = 1.0 / _248;
        float _282 = fma(_256, _264, _262);
        float _284 = _282 * _222;
        float _286 = fma(_272, _276, _268);
        float _288 = _278 * _164;
        float _290 = _286 * _164;
        float _292 = fma(_274, _280, _270);
        float _294 = _292 * _222;
        float2 _811 = float2(_288, _284);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_811, float2(0.0), isnan(_811)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_811, float2(0.0), isnan(_811)), level(_134)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _826 = float2(_290, _284);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_826, float2(0.0), isnan(_826)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_826, float2(0.0), isnan(_826)), level(_134)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _841 = float2(_288, _294);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_841, float2(0.0), isnan(_841)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_841, float2(0.0), isnan(_841)), level(_134)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _856 = float2(_290, _294);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_856, float2(0.0), isnan(_856)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_856, float2(0.0), isnan(_856)), level(_134)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = -_310;
        float _332 = _302 + _330;
        float _334 = -_308;
        float _336 = _300 + _334;
        float _338 = -_326;
        float _340 = _318 + _338;
        float _342 = -_324;
        float _344 = _316 + _342;
        float _346 = fma(_242, _332, _310);
        float _348 = fma(_242, _336, _308);
        float _350 = fma(_242, _340, _326);
        float _352 = -_312;
        float _354 = _304 + _352;
        float _356 = -_328;
        float _358 = _320 + _356;
        float _360 = fma(_242, _344, _324);
        float _362 = -_350;
        float _364 = _362 + _346;
        float _366 = fma(_242, _354, _312);
        float _368 = fma(_242, _358, _328);
        float _370 = -_360;
        float _372 = _370 + _348;
        float _374 = fma(_246, _364, _350);
        float _376 = 0.0 + _132;
        float _378 = precise::clamp(_376, 0.0, 1.0);
        float _380 = -_368;
        float _382 = _380 + _366;
        float _384 = fma(_246, _372, _360);
        float _386 = _374 * 0.586600005626678466796875;
        float _388 = _124 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _390 = fma(_246, _382, _368);
        float _392 = fma(_88, _378, _86);
        float _394 = fma(_384, 0.29890000820159912109375, _386);
        float _396 = fma(_390, 0.1143999993801116943359375, _394);
        float _398 = -_384;
        float _400 = _398 + _396;
        float _402 = -_374;
        float _404 = _402 + _396;
        float _406 = -_390;
        float _408 = _406 + _396;
        float _410 = fma(_388, _400, _384);
        float _412 = fma(_388, _404, _374);
        float _414 = fma(_388, _408, _390);
        float _416 = -_410;
        float _418 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[13].x, _416);
        float _420 = -_412;
        float _422 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[13].y, _420);
        float _424 = -_414;
        float _426 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[13].z, _424);
        float _428 = 1.0 / _392;
        float _430 = fma(_124, _418, _410);
        float _432 = fma(_124, _422, _412);
        float _434 = fma(_124, _426, _414);
        float _436 = _378 * _430;
        float _438 = _378 * _432;
        float _440 = _378 * _434;
        float _442 = -_436;
        float _444 = _442 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _446 = -_438;
        float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _450 = -_440;
        float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _454 = fma(_86, _444, _436);
        float _456 = fma(_86, _448, _438);
        float _458 = fma(_86, _452, _440);
        float _460 = _454 * _428;
        float _462 = _456 * _428;
        float _464 = _458 * _428;
        out.m_36.x = _460;
        out.m_36.y = _462;
        out.m_36.z = _464;
        out.m_36.w = _392;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _86;
    return out;
}


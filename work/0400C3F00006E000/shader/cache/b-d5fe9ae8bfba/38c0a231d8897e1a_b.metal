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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _976, thread const int& _977, constant _10& support_buffer)
{
    int _980 = 1 + _977;
    float _982 = support_buffer._m5[_980].x;
    float _984 = abs(_982);
    bool _986 = _984 == 1.0;
    if (_986)
    {
        return _976;
    }
    float _988 = float(_976);
    float _990 = _988 / _984;
    int _992 = int(_990);
    return _992;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _448 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _74 = precise::clamp(_72, 0.0, 1.0);
    bool _78 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    bool _84 = !_78;
    float _86 = _84 ? _74 : 0.0;
    float _88 = precise::max(_86, _82);
    bool _90 = _88 != 0.0;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan(0.0);
    bool _98 = _94 || _96;
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::min(_102, _106);
    bool _110 = !_98;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_88, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _40(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _40(_134, _136, (*spvDescriptorSet0.support_buffer));
        float _140 = float(_130);
        float _142 = float(_138);
        float _144 = fma(_60, _140, -0.5);
        float _146 = fma(_62, _142, -0.5);
        float _148 = 1.0 / _140;
        float _150 = floor(_144);
        float _152 = floor(_146);
        float _154 = -_150;
        float _156 = _144 + _154;
        float _158 = -_156;
        float _160 = _158 + 1.0;
        float _162 = -_156;
        float _164 = _162 + 2.0;
        float _166 = -_152;
        float _168 = _146 + _166;
        float _170 = _160 * _160;
        float _172 = _164 * _164;
        float _174 = -_168;
        float _176 = _174 + 1.0;
        float _178 = _160 * _170;
        float _180 = _176 * _176;
        float _182 = _178 * 4.0;
        float _184 = _176 * _180;
        float _186 = -_168;
        float _188 = _186 + 2.0;
        float _190 = -_182;
        float _192 = fma(_164, _172, _190);
        float _194 = -_178;
        float _196 = _194 + 6.0;
        float _198 = _184 * 4.0;
        float _200 = _188 * _188;
        float _202 = _178 + _192;
        float _204 = -_192;
        float _206 = _204 + _196;
        float _208 = _192 * 0.16666667163372039794921875;
        float _210 = -_198;
        float _212 = fma(_188, _200, _210);
        float _214 = -_184;
        float _216 = _214 + 6.0;
        float _218 = _206 * 0.16666667163372039794921875;
        float _220 = _202 * 0.16666667163372039794921875;
        float _222 = _184 + _212;
        float _224 = -_212;
        float _226 = _224 + _216;
        float _228 = 1.0 / _142;
        float _230 = _168 * _168;
        float _232 = _222 * 0.16666667163372039794921875;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = _212 * 0.16666667163372039794921875;
        float _238 = _168 * _230;
        float _240 = _150 + (-0.5);
        float _242 = _152 + 1.5;
        float _244 = 1.0 / _232;
        float _246 = _156 * _156;
        float _248 = _238 * 0.16666667163372039794921875;
        float _250 = _156 * _246;
        float _252 = _150 + 1.5;
        float _254 = _152 + (-0.5);
        float _256 = 1.0 / _220;
        float _258 = _250 * 0.16666667163372039794921875;
        float _260 = 1.0 / _218;
        float _262 = fma(_236, _244, _254);
        float _264 = _262 * _228;
        float _266 = 1.0 / _234;
        float _268 = fma(_208, _256, _240);
        float _270 = fma(_258, _260, _252);
        float _272 = _270 * _148;
        float _274 = fma(_248, _266, _242);
        float _276 = _268 * _148;
        float _278 = _274 * _228;
        float2 _748 = float2(_276, _264);
        float3 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_748, float2(0.0), isnan(_748)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_748, float2(0.0), isnan(_748)), level(_118)).xyz;
        float _284 = _282.x;
        float _286 = _282.y;
        float _288 = _282.z;
        float2 _763 = float2(_272, _264);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_763, float2(0.0), isnan(_763)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_763, float2(0.0), isnan(_763)), level(_118)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _778 = float2(_276, _278);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_778, float2(0.0), isnan(_778)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_778, float2(0.0), isnan(_778)), level(_118)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _793 = float2(_272, _278);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_793, float2(0.0), isnan(_793)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_793, float2(0.0), isnan(_793)), level(_118)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float _314 = 0.0 + _116;
        float _316 = precise::clamp(_314, 0.0, 1.0);
        float _318 = -_292;
        float _320 = _284 + _318;
        float _322 = -_294;
        float _324 = _286 + _322;
        float _326 = -_296;
        float _328 = _288 + _326;
        float _330 = -_310;
        float _332 = _302 + _330;
        float _334 = fma(_220, _320, _292);
        float _336 = fma(_220, _324, _294);
        float _338 = -_308;
        float _340 = _300 + _338;
        float _342 = fma(_220, _332, _310);
        float _344 = -_312;
        float _346 = _304 + _344;
        float _348 = fma(_220, _328, _296);
        float _350 = fma(_220, _340, _308);
        float _352 = -_342;
        float _354 = _352 + _336;
        float _356 = fma(_220, _346, _312);
        float _358 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _360 = -_350;
        float _362 = _360 + _334;
        float _364 = fma(_232, _354, _342);
        float _366 = -_356;
        float _368 = _366 + _348;
        float _370 = fma(_232, _362, _350);
        float _372 = _364 * 0.586600005626678466796875;
        float _374 = fma(_232, _368, _356);
        float _376 = fma(_370, 0.29890000820159912109375, _372);
        float _378 = fma(_374, 0.1143999993801116943359375, _376);
        float _380 = -_370;
        float _382 = _380 + _378;
        float _384 = -_364;
        float _386 = _384 + _378;
        float _388 = -_374;
        float _390 = _388 + _378;
        float _392 = fma(_358, _382, _370);
        float _394 = fma(_358, _386, _364);
        float _396 = fma(_358, _390, _374);
        float _398 = -_392;
        float _400 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
        float _402 = -_394;
        float _404 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[13].y, _402);
        float _406 = -_396;
        float _408 = fma(_396, (*spvDescriptorSet0.fp_c3)._m0[13].z, _406);
        float _410 = fma(_108, _400, _392);
        float _412 = fma(_108, _404, _394);
        float _414 = fma(_108, _408, _396);
        out.m_34.x = _410;
        out.m_34.y = _412;
        out.m_34.z = _414;
        out.m_34.w = _316;
        return out;
    }
    discard_fragment();
    return out;
}


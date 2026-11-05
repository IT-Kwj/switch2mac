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
int _42(thread const int& _1033, thread const int& _1034, constant _10& support_buffer)
{
    int _1037 = 1 + _1034;
    float _1039 = support_buffer._m5[_1037].x;
    float _1041 = abs(_1039);
    bool _1043 = _1041 == 1.0;
    if (_1043)
    {
        return _1033;
    }
    float _1045 = float(_1033);
    float _1047 = _1045 / _1041;
    int _1049 = int(_1047);
    return _1049;
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
    float2 _474 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).x;
    float _68 = in.m_33.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_94, _90);
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    bool _108 = _100 != 0.0;
    bool _110 = isnan(_100);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    float _118 = precise::min(_98, _104);
    bool _120 = !_116;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_100, _122, 1.0);
        float _126 = log2(_124);
        float _128 = _126 + (-1.0);
        float _130 = trunc(_128);
        int _132 = int(_130);
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).x;
        int _136 = _134;
        int _138 = 1;
        int _140 = _42(_136, _138, (*spvDescriptorSet0.support_buffer));
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).y;
        int _144 = _142;
        int _146 = 1;
        int _148 = _42(_144, _146, (*spvDescriptorSet0.support_buffer));
        float _150 = float(_140);
        float _152 = float(_148);
        float _154 = fma(_62, _150, -0.5);
        float _156 = fma(_64, _152, -0.5);
        float _158 = 1.0 / _150;
        float _160 = floor(_154);
        float _162 = floor(_156);
        float _164 = -_160;
        float _166 = _154 + _164;
        float _168 = 1.0 / _152;
        float _170 = -_166;
        float _172 = _170 + 1.0;
        float _174 = -_166;
        float _176 = _174 + 2.0;
        float _178 = -_162;
        float _180 = _156 + _178;
        float _182 = _172 * _172;
        float _184 = _162 + 1.5;
        float _186 = -_180;
        float _188 = _186 + 1.0;
        float _190 = _172 * _182;
        float _192 = -_180;
        float _194 = _192 + 2.0;
        float _196 = _176 * _176;
        float _198 = _188 * _188;
        float _200 = _166 * _166;
        float _202 = _194 * _194;
        float _204 = _188 * _198;
        float _206 = _190 * 4.0;
        float _208 = _166 * _200;
        float _210 = _160 + (-0.5);
        float _212 = _204 * 4.0;
        float _214 = -_206;
        float _216 = fma(_176, _196, _214);
        float _218 = -_190;
        float _220 = _218 + 6.0;
        float _222 = -_212;
        float _224 = fma(_194, _202, _222);
        float _226 = -_204;
        float _228 = _226 + 6.0;
        float _230 = -_216;
        float _232 = _230 + _220;
        float _234 = -_224;
        float _236 = _234 + _228;
        float _238 = _232 * 0.16666667163372039794921875;
        float _240 = _190 + _216;
        float _242 = _180 * _180;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = _204 + _224;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = 1.0 / _238;
        float _252 = _180 * _242;
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = _162 + (-0.5);
        float _258 = _224 * 0.16666667163372039794921875;
        float _260 = _160 + 1.5;
        float _262 = _216 * 0.16666667163372039794921875;
        float _264 = _208 * 0.16666667163372039794921875;
        float _266 = 1.0 / _254;
        float _268 = _252 * 0.16666667163372039794921875;
        float _270 = 1.0 / _248;
        float _272 = fma(_264, _250, _260);
        float _274 = 1.0 / _244;
        float _276 = fma(_258, _266, _256);
        float _278 = _276 * _168;
        float _280 = fma(_262, _270, _210);
        float _282 = _272 * _158;
        float _284 = _280 * _158;
        float _286 = fma(_268, _274, _184);
        float _288 = _286 * _168;
        float2 _776 = float2(_284, _278);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_776, float2(0.0), isnan(_776)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_776, float2(0.0), isnan(_776)), level(_128)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _791 = float2(_282, _278);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_791, float2(0.0), isnan(_791)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_791, float2(0.0), isnan(_791)), level(_128)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _806 = float2(_284, _288);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_806, float2(0.0), isnan(_806)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_806, float2(0.0), isnan(_806)), level(_128)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _821 = float2(_282, _288);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_821, float2(0.0), isnan(_821)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_821, float2(0.0), isnan(_821)), level(_128)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float _324 = 0.0 + _126;
        float _326 = precise::clamp(_324, 0.0, 1.0);
        float _328 = fma(_86, _326, _88);
        float _330 = -_304;
        float _332 = _296 + _330;
        float _334 = -_302;
        float _336 = _294 + _334;
        float _338 = -_320;
        float _340 = _312 + _338;
        float _342 = -_318;
        float _344 = _310 + _342;
        float _346 = fma(_248, _332, _304);
        float _348 = fma(_248, _336, _302);
        float _350 = fma(_248, _340, _320);
        float _352 = -_306;
        float _354 = _298 + _352;
        float _356 = -_322;
        float _358 = _314 + _356;
        float _360 = fma(_248, _344, _318);
        float _362 = -_350;
        float _364 = _362 + _346;
        float _366 = fma(_248, _354, _306);
        float _368 = fma(_248, _358, _322);
        float _370 = -_360;
        float _372 = _370 + _348;
        float _374 = fma(_254, _364, _350);
        float _376 = _326 * _86;
        float _378 = -_368;
        float _380 = _378 + _366;
        float _382 = fma(_254, _372, _360);
        float _384 = _374 * 0.586600005626678466796875;
        float _386 = 1.0 / _328;
        float _388 = fma(_254, _380, _368);
        float _390 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _392 = fma(_382, 0.29890000820159912109375, _384);
        float _394 = fma(_388, 0.1143999993801116943359375, _392);
        float _396 = -_388;
        float _398 = _396 + _394;
        float _400 = -_382;
        float _402 = _400 + _394;
        float _404 = -_374;
        float _406 = _404 + _394;
        float _408 = fma(_390, _398, _388);
        float _410 = fma(_390, _402, _382);
        float _412 = fma(_390, _406, _374);
        float _414 = -_408;
        float _416 = fma(_408, (*spvDescriptorSet0.fp_c3)._m0[13].z, _414);
        float _418 = -_410;
        float _420 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[13].x, _418);
        float _422 = -_412;
        float _424 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[13].y, _422);
        float _426 = fma(_118, _416, _408);
        float _428 = fma(_118, _420, _410);
        float _430 = _386 * _376;
        float _432 = fma(_118, _424, _412);
        float _434 = _426 * _376;
        float _436 = _428 * _430;
        float _438 = _432 * _430;
        float _440 = _434 * _386;
        out.m_36.x = _436;
        out.m_36.y = _438;
        out.m_36.z = _440;
        out.m_36.w = _328;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _88;
    return out;
}


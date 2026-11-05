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
int _40(thread const int& _944, thread const int& _945, constant _10& support_buffer)
{
    int _948 = 1 + _945;
    float _950 = support_buffer._m5[_948].x;
    float _952 = abs(_950);
    bool _954 = _952 == 1.0;
    if (_954)
    {
        return _944;
    }
    float _956 = float(_944);
    float _958 = _956 / _952;
    int _960 = int(_958);
    return _960;
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
    float2 _436 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_436, float2(0.0), isnan(_436))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = precise::max(_68, _72);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    bool _86 = _78 != 0.0;
    bool _88 = isnan(_78);
    bool _90 = _86 || _88;
    bool _92 = isnan(0.0);
    bool _94 = _90 || _92;
    float _96 = precise::min(_82, _76);
    bool _98 = !_94;
    if (!_98)
    {
        float _100 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _102 = fma(_78, _100, 1.0);
        float _104 = log2(_102);
        float _106 = _104 + (-1.0);
        float _108 = trunc(_106);
        int _110 = int(_108);
        int _112 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).x;
        int _114 = _112;
        int _116 = 1;
        int _118 = _40(_114, _116, (*spvDescriptorSet0.support_buffer));
        int _120 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).y;
        int _122 = _120;
        int _124 = 1;
        int _126 = _40(_122, _124, (*spvDescriptorSet0.support_buffer));
        float _128 = float(_118);
        float _130 = float(_126);
        float _132 = fma(_60, _128, -0.5);
        float _134 = fma(_62, _130, -0.5);
        float _136 = 1.0 / _128;
        float _138 = floor(_132);
        float _140 = floor(_134);
        float _142 = -_138;
        float _144 = _132 + _142;
        float _146 = -_144;
        float _148 = _146 + 1.0;
        float _150 = -_144;
        float _152 = _150 + 2.0;
        float _154 = -_140;
        float _156 = _134 + _154;
        float _158 = _148 * _148;
        float _160 = _152 * _152;
        float _162 = -_156;
        float _164 = _162 + 1.0;
        float _166 = _148 * _158;
        float _168 = _164 * _164;
        float _170 = _166 * 4.0;
        float _172 = _164 * _168;
        float _174 = -_156;
        float _176 = _174 + 2.0;
        float _178 = -_170;
        float _180 = fma(_152, _160, _178);
        float _182 = -_166;
        float _184 = _182 + 6.0;
        float _186 = _172 * 4.0;
        float _188 = _176 * _176;
        float _190 = _166 + _180;
        float _192 = -_180;
        float _194 = _192 + _184;
        float _196 = _180 * 0.16666667163372039794921875;
        float _198 = -_186;
        float _200 = fma(_176, _188, _198);
        float _202 = -_172;
        float _204 = _202 + 6.0;
        float _206 = _194 * 0.16666667163372039794921875;
        float _208 = _190 * 0.16666667163372039794921875;
        float _210 = _172 + _200;
        float _212 = -_200;
        float _214 = _212 + _204;
        float _216 = 1.0 / _130;
        float _218 = _156 * _156;
        float _220 = _210 * 0.16666667163372039794921875;
        float _222 = _214 * 0.16666667163372039794921875;
        float _224 = _200 * 0.16666667163372039794921875;
        float _226 = _156 * _218;
        float _228 = _138 + (-0.5);
        float _230 = _140 + 1.5;
        float _232 = 1.0 / _220;
        float _234 = _144 * _144;
        float _236 = _226 * 0.16666667163372039794921875;
        float _238 = _144 * _234;
        float _240 = _138 + 1.5;
        float _242 = _140 + (-0.5);
        float _244 = 1.0 / _208;
        float _246 = _238 * 0.16666667163372039794921875;
        float _248 = 1.0 / _206;
        float _250 = fma(_224, _232, _242);
        float _252 = _250 * _216;
        float _254 = 1.0 / _222;
        float _256 = fma(_196, _244, _228);
        float _258 = fma(_246, _248, _240);
        float _260 = _258 * _136;
        float _262 = fma(_236, _254, _230);
        float _264 = _256 * _136;
        float _266 = _262 * _216;
        float2 _716 = float2(_264, _252);
        float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_716, float2(0.0), isnan(_716)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_716, float2(0.0), isnan(_716)), level(_106)).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        float2 _731 = float2(_260, _252);
        float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_731, float2(0.0), isnan(_731)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_731, float2(0.0), isnan(_731)), level(_106)).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        float2 _746 = float2(_264, _266);
        float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_746, float2(0.0), isnan(_746)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_746, float2(0.0), isnan(_746)), level(_106)).xyz;
        float _288 = _286.x;
        float _290 = _286.y;
        float _292 = _286.z;
        float2 _761 = float2(_260, _266);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_761, float2(0.0), isnan(_761)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_761, float2(0.0), isnan(_761)), level(_106)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float _302 = 0.0 + _104;
        float _304 = precise::clamp(_302, 0.0, 1.0);
        float _306 = -_280;
        float _308 = _272 + _306;
        float _310 = -_282;
        float _312 = _274 + _310;
        float _314 = -_284;
        float _316 = _276 + _314;
        float _318 = -_298;
        float _320 = _290 + _318;
        float _322 = fma(_208, _308, _280);
        float _324 = fma(_208, _312, _282);
        float _326 = -_296;
        float _328 = _288 + _326;
        float _330 = fma(_208, _320, _298);
        float _332 = -_300;
        float _334 = _292 + _332;
        float _336 = fma(_208, _316, _284);
        float _338 = fma(_208, _328, _296);
        float _340 = -_330;
        float _342 = _340 + _324;
        float _344 = fma(_208, _334, _300);
        float _346 = _96 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _348 = -_338;
        float _350 = _348 + _322;
        float _352 = fma(_220, _342, _330);
        float _354 = -_344;
        float _356 = _354 + _336;
        float _358 = fma(_220, _350, _338);
        float _360 = _352 * 0.586600005626678466796875;
        float _362 = fma(_220, _356, _344);
        float _364 = fma(_358, 0.29890000820159912109375, _360);
        float _366 = fma(_362, 0.1143999993801116943359375, _364);
        float _368 = -_358;
        float _370 = _368 + _366;
        float _372 = -_352;
        float _374 = _372 + _366;
        float _376 = -_362;
        float _378 = _376 + _366;
        float _380 = fma(_346, _370, _358);
        float _382 = fma(_346, _374, _352);
        float _384 = fma(_346, _378, _362);
        float _386 = -_380;
        float _388 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[13].x, _386);
        float _390 = -_382;
        float _392 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].y, _390);
        float _394 = -_384;
        float _396 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
        float _398 = fma(_96, _388, _380);
        float _400 = fma(_96, _392, _382);
        float _402 = fma(_96, _396, _384);
        out.m_34.x = _398;
        out.m_34.y = _400;
        out.m_34.z = _402;
        out.m_34.w = _304;
        return out;
    }
    discard_fragment();
    return out;
}


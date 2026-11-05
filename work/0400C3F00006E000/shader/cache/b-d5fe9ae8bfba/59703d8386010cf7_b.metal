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
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _981, thread const int& _982, constant _10& support_buffer)
{
    int _985 = 1 + _982;
    float _987 = support_buffer._m5[_985].x;
    float _989 = abs(_987);
    bool _991 = _989 == 1.0;
    if (_991)
    {
        return _981;
    }
    float _993 = float(_981);
    float _995 = _993 / _989;
    int _997 = int(_995);
    return _997;
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
    float2 _450 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_450, float2(0.0), isnan(_450))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = _60 * _76;
    float _100 = _60 * _82;
    float _102 = _60 * _88;
    float _104 = precise::max(_92, _98);
    bool _106 = _104 != 0.0;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = precise::min(_96, _118);
    bool _122 = !_114;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_104, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        float _152 = float(_150);
        float _154 = float(_142);
        float _156 = fma(_64, _152, -0.5);
        float _158 = fma(_62, _154, -0.5);
        float _160 = floor(_156);
        float _162 = floor(_158);
        float _164 = -_160;
        float _166 = _156 + _164;
        float _168 = -_166;
        float _170 = _168 + 1.0;
        float _172 = _166 * _166;
        float _174 = -_162;
        float _176 = _158 + _174;
        float _178 = _170 * _170;
        float _180 = _166 * _172;
        float _182 = -_176;
        float _184 = _182 + 1.0;
        float _186 = _170 * _178;
        float _188 = -_176;
        float _190 = _188 + 2.0;
        float _192 = -_166;
        float _194 = _192 + 2.0;
        float _196 = _184 * _184;
        float _198 = _186 * 4.0;
        float _200 = _190 * _190;
        float _202 = _194 * _194;
        float _204 = _184 * _196;
        float _206 = _162 + (-0.5);
        float _208 = _162 + 1.5;
        float _210 = -_198;
        float _212 = fma(_194, _202, _210);
        float _214 = _204 * 4.0;
        float _216 = -_204;
        float _218 = _216 + 6.0;
        float _220 = -_186;
        float _222 = _220 + 6.0;
        float _224 = 1.0 / _154;
        float _226 = -_214;
        float _228 = fma(_190, _200, _226);
        float _230 = _186 + _212;
        float _232 = -_212;
        float _234 = _232 + _222;
        float _236 = _212 * 0.16666667163372039794921875;
        float _238 = -_228;
        float _240 = _238 + _218;
        float _242 = _204 + _228;
        float _244 = _230 * 0.16666667163372039794921875;
        float _246 = _234 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = _242 * 0.16666667163372039794921875;
        float _252 = 1.0 / _244;
        float _254 = _160 + 1.5;
        float _256 = _228 * 0.16666667163372039794921875;
        float _258 = _180 * 0.16666667163372039794921875;
        float _260 = 1.0 / _250;
        float _262 = 1.0 / _248;
        float _264 = 1.0 / _246;
        float _266 = fma(_256, _260, _206);
        float _268 = _266 * _224;
        float _270 = 1.0 / _152;
        float _272 = _160 + (-0.5);
        float _274 = fma(_236, _252, _272);
        float _276 = fma(_258, _264, _254);
        float _278 = _176 * _176;
        float _280 = _176 * _278;
        float _282 = _280 * 0.16666667163372039794921875;
        float _284 = fma(_282, _262, _208);
        float _286 = _274 * _270;
        float _288 = _276 * _270;
        float _290 = _284 * _224;
        float2 _767 = float2(_268, _286);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_767, float2(0.0), isnan(_767)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_767, float2(0.0), isnan(_767)), level(_130)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _782 = float2(_290, _286);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_782, float2(0.0), isnan(_782)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_782, float2(0.0), isnan(_782)), level(_130)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _797 = float2(_268, _288);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_797, float2(0.0), isnan(_797)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_797, float2(0.0), isnan(_797)), level(_130)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _812 = float2(_290, _288);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_812, float2(0.0), isnan(_812)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_812, float2(0.0), isnan(_812)), level(_130)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = 0.0 + _128;
        float _328 = precise::clamp(_326, 0.0, 1.0);
        float _330 = fma(_102, _328, _100);
        float _332 = _328 * _102;
        float _334 = -_308;
        float _336 = _300 + _334;
        float _338 = -_304;
        float _340 = _296 + _338;
        float _342 = -_306;
        float _344 = _298 + _342;
        float _346 = -_324;
        float _348 = _316 + _346;
        float _350 = -_320;
        float _352 = _312 + _350;
        float _354 = fma(_250, _336, _308);
        float _356 = -_322;
        float _358 = _314 + _356;
        float _360 = fma(_250, _348, _324);
        float _362 = fma(_250, _340, _304);
        float _364 = fma(_250, _352, _320);
        float _366 = 1.0 / _330;
        float _368 = fma(_250, _344, _306);
        float _370 = fma(_250, _358, _322);
        float _372 = -_360;
        float _374 = _372 + _354;
        float _376 = -_364;
        float _378 = _376 + _362;
        float _380 = -_370;
        float _382 = _380 + _368;
        float _384 = fma(_244, _374, _360);
        float _386 = fma(_244, _378, _364);
        float _388 = fma(_244, _382, _370);
        float _390 = -_384;
        float _392 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].z, _390);
        float _394 = -_386;
        float _396 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[13].x, _394);
        float _398 = -_388;
        float _400 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[13].y, _398);
        float _402 = fma(_120, _392, _384);
        float _404 = fma(_120, _396, _386);
        float _406 = _366 * _332;
        float _408 = fma(_120, _400, _388);
        float _410 = _402 * _332;
        float _412 = _404 * _406;
        float _414 = _408 * _406;
        float _416 = _410 * _366;
        out.m_34.x = _412;
        out.m_34.y = _414;
        out.m_34.z = _416;
        out.m_34.w = _330;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _100;
    return out;
}


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
int _42(thread const int& _900, thread const int& _901, constant _10& support_buffer)
{
    int _904 = 1 + _901;
    float _906 = support_buffer._m5[_904].x;
    float _908 = abs(_906);
    bool _910 = _908 == 1.0;
    if (_910)
    {
        return _900;
    }
    float _912 = float(_900);
    float _914 = _912 / _908;
    int _916 = int(_914);
    return _916;
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
    float2 _422 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_422, float2(0.0), isnan(_422))).x;
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
    float _94 = _60 * _76;
    float _96 = _60 * _82;
    float _98 = _60 * _88;
    float _100 = precise::max(_92, _94);
    bool _102 = _100 != 0.0;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    bool _112 = !_110;
    if (!_112)
    {
        float _114 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _116 = fma(_100, _114, 1.0);
        float _118 = log2(_116);
        float _120 = _118 + (-1.0);
        float _122 = trunc(_120);
        int _124 = int(_122);
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).x;
        int _128 = _126;
        int _130 = 1;
        int _132 = _42(_128, _130, (*spvDescriptorSet0.support_buffer));
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).y;
        int _136 = _134;
        int _138 = 1;
        int _140 = _42(_136, _138, (*spvDescriptorSet0.support_buffer));
        float _142 = float(_132);
        float _144 = float(_140);
        float _146 = fma(_62, _142, -0.5);
        float _148 = fma(_64, _144, -0.5);
        float _150 = floor(_146);
        float _152 = floor(_148);
        float _154 = -_150;
        float _156 = _146 + _154;
        float _158 = 1.0 / _144;
        float _160 = -_156;
        float _162 = _160 + 1.0;
        float _164 = -_156;
        float _166 = _164 + 2.0;
        float _168 = -_152;
        float _170 = _148 + _168;
        float _172 = _162 * _162;
        float _174 = _152 + (-0.5);
        float _176 = _152 + 1.5;
        float _178 = -_170;
        float _180 = _178 + 1.0;
        float _182 = _162 * _172;
        float _184 = -_170;
        float _186 = _184 + 2.0;
        float _188 = _166 * _166;
        float _190 = _180 * _180;
        float _192 = 1.0 / _142;
        float _194 = _186 * _186;
        float _196 = _180 * _190;
        float _198 = _182 * 4.0;
        float _200 = _196 * 4.0;
        float _202 = -_198;
        float _204 = fma(_166, _188, _202);
        float _206 = -_182;
        float _208 = _206 + 6.0;
        float _210 = -_200;
        float _212 = fma(_186, _194, _210);
        float _214 = -_196;
        float _216 = _214 + 6.0;
        float _218 = -_204;
        float _220 = _218 + _208;
        float _222 = _182 + _204;
        float _224 = _196 + _212;
        float _226 = -_212;
        float _228 = _226 + _216;
        float _230 = _220 * 0.16666667163372039794921875;
        float _232 = _222 * 0.16666667163372039794921875;
        float _234 = _224 * 0.16666667163372039794921875;
        float _236 = _228 * 0.16666667163372039794921875;
        float _238 = _156 * _156;
        float _240 = 1.0 / _232;
        float _242 = _170 * _170;
        float _244 = _212 * 0.16666667163372039794921875;
        float _246 = _156 * _238;
        float _248 = _204 * 0.16666667163372039794921875;
        float _250 = _170 * _242;
        float _252 = _150 + (-0.5);
        float _254 = _150 + 1.5;
        float _256 = 1.0 / _234;
        float _258 = _246 * 0.16666667163372039794921875;
        float _260 = _250 * 0.16666667163372039794921875;
        float _262 = 1.0 / _230;
        float _264 = fma(_248, _240, _252);
        float _266 = 1.0 / _236;
        float _268 = fma(_244, _256, _174);
        float _270 = fma(_258, _262, _254);
        float _272 = _268 * _158;
        float _274 = fma(_260, _266, _176);
        float _276 = _264 * _192;
        float _278 = _270 * _192;
        float _280 = _274 * _158;
        float2 _720 = float2(_276, _272);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_720, float2(0.0), isnan(_720)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_720, float2(0.0), isnan(_720)), level(_120)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float2 _735 = float2(_278, _272);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_735, float2(0.0), isnan(_735)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_735, float2(0.0), isnan(_735)), level(_120)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _750 = float2(_276, _280);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_750, float2(0.0), isnan(_750)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_750, float2(0.0), isnan(_750)), level(_120)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _765 = float2(_278, _280);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_765, float2(0.0), isnan(_765)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_765, float2(0.0), isnan(_765)), level(_120)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float _316 = 0.0 + _118;
        float _318 = precise::clamp(_316, 0.0, 1.0);
        float _320 = fma(_98, _318, _96);
        float _322 = _318 * _98;
        float _324 = 1.0 / _320;
        float _326 = -_298;
        float _328 = _290 + _326;
        float _330 = -_294;
        float _332 = _286 + _330;
        float _334 = -_314;
        float _336 = _306 + _334;
        float _338 = fma(_232, _328, _298);
        float _340 = -_310;
        float _342 = _302 + _340;
        float _344 = -_296;
        float _346 = _288 + _344;
        float _348 = -_312;
        float _350 = _304 + _348;
        float _352 = fma(_232, _336, _314);
        float _354 = fma(_232, _332, _294);
        float _356 = fma(_232, _342, _310);
        float _358 = fma(_232, _346, _296);
        float _360 = fma(_232, _350, _312);
        float _362 = -_352;
        float _364 = _362 + _338;
        float _366 = -_356;
        float _368 = _366 + _354;
        float _370 = _324 * _322;
        float _372 = -_360;
        float _374 = _372 + _358;
        float _376 = fma(_234, _364, _352);
        float _378 = fma(_234, _368, _356);
        float _380 = fma(_234, _374, _360);
        float _382 = _376 * _322;
        float _384 = _378 * _370;
        float _386 = _380 * _370;
        float _388 = _382 * _324;
        out.m_34.x = _384;
        out.m_34.y = _386;
        out.m_34.z = _388;
        out.m_34.w = _320;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _96;
    return out;
}


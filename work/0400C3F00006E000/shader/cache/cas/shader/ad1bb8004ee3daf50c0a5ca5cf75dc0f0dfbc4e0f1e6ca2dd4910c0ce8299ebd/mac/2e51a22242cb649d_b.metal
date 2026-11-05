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
int _42(thread const int& _884, thread const int& _885, constant _10& support_buffer)
{
    int _888 = 1 + _885;
    float _890 = support_buffer._m5[_888].x;
    float _892 = abs(_890);
    bool _894 = _892 == 1.0;
    if (_894)
    {
        return _884;
    }
    float _896 = float(_884);
    float _898 = _896 / _892;
    int _900 = int(_898);
    return _900;
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
    float2 _420 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).x;
    float _68 = in.m_33.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::max(_94, _86);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    bool _110 = !_108;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_96, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _42(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        float _140 = float(_130);
        float _142 = float(_138);
        float _144 = fma(_62, _140, -0.5);
        float _146 = fma(_64, _142, -0.5);
        float _148 = floor(_144);
        float _150 = floor(_146);
        float _152 = -_148;
        float _154 = _144 + _152;
        float _156 = 1.0 / _142;
        float _158 = -_154;
        float _160 = _158 + 1.0;
        float _162 = -_154;
        float _164 = _162 + 2.0;
        float _166 = -_150;
        float _168 = _146 + _166;
        float _170 = _160 * _160;
        float _172 = _150 + (-0.5);
        float _174 = _150 + 1.5;
        float _176 = -_168;
        float _178 = _176 + 1.0;
        float _180 = _160 * _170;
        float _182 = -_168;
        float _184 = _182 + 2.0;
        float _186 = _164 * _164;
        float _188 = _178 * _178;
        float _190 = 1.0 / _140;
        float _192 = _184 * _184;
        float _194 = _178 * _188;
        float _196 = _180 * 4.0;
        float _198 = _194 * 4.0;
        float _200 = -_196;
        float _202 = fma(_164, _186, _200);
        float _204 = -_180;
        float _206 = _204 + 6.0;
        float _208 = -_198;
        float _210 = fma(_184, _192, _208);
        float _212 = -_194;
        float _214 = _212 + 6.0;
        float _216 = -_202;
        float _218 = _216 + _206;
        float _220 = _180 + _202;
        float _222 = _194 + _210;
        float _224 = -_210;
        float _226 = _224 + _214;
        float _228 = _218 * 0.16666667163372039794921875;
        float _230 = _220 * 0.16666667163372039794921875;
        float _232 = _222 * 0.16666667163372039794921875;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = _154 * _154;
        float _238 = 1.0 / _230;
        float _240 = _168 * _168;
        float _242 = _210 * 0.16666667163372039794921875;
        float _244 = _154 * _236;
        float _246 = _202 * 0.16666667163372039794921875;
        float _248 = _168 * _240;
        float _250 = _148 + (-0.5);
        float _252 = _148 + 1.5;
        float _254 = 1.0 / _232;
        float _256 = _244 * 0.16666667163372039794921875;
        float _258 = _248 * 0.16666667163372039794921875;
        float _260 = 1.0 / _228;
        float _262 = fma(_246, _238, _250);
        float _264 = 1.0 / _234;
        float _266 = fma(_242, _254, _172);
        float _268 = fma(_256, _260, _252);
        float _270 = _266 * _156;
        float _272 = fma(_258, _264, _174);
        float _274 = _262 * _190;
        float _276 = _268 * _190;
        float _278 = _272 * _156;
        float2 _703 = float2(_274, _270);
        float3 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_703, float2(0.0), isnan(_703)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_703, float2(0.0), isnan(_703)), level(_118)).xyz;
        float _284 = _282.x;
        float _286 = _282.y;
        float _288 = _282.z;
        float2 _718 = float2(_276, _270);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_718, float2(0.0), isnan(_718)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_718, float2(0.0), isnan(_718)), level(_118)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _733 = float2(_274, _278);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_733, float2(0.0), isnan(_733)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_733, float2(0.0), isnan(_733)), level(_118)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _748 = float2(_276, _278);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_748, float2(0.0), isnan(_748)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_748, float2(0.0), isnan(_748)), level(_118)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float _314 = 0.0 + _116;
        float _316 = precise::clamp(_314, 0.0, 1.0);
        float _318 = fma(_90, _316, _88);
        float _320 = _316 * _90;
        float _322 = 1.0 / _318;
        float _324 = -_296;
        float _326 = _288 + _324;
        float _328 = -_292;
        float _330 = _284 + _328;
        float _332 = -_312;
        float _334 = _304 + _332;
        float _336 = fma(_230, _326, _296);
        float _338 = -_308;
        float _340 = _300 + _338;
        float _342 = -_294;
        float _344 = _286 + _342;
        float _346 = -_310;
        float _348 = _302 + _346;
        float _350 = fma(_230, _334, _312);
        float _352 = fma(_230, _330, _292);
        float _354 = fma(_230, _340, _308);
        float _356 = fma(_230, _344, _294);
        float _358 = fma(_230, _348, _310);
        float _360 = -_350;
        float _362 = _360 + _336;
        float _364 = -_354;
        float _366 = _364 + _352;
        float _368 = _322 * _320;
        float _370 = -_358;
        float _372 = _370 + _356;
        float _374 = fma(_232, _362, _350);
        float _376 = fma(_232, _366, _354);
        float _378 = fma(_232, _372, _358);
        float _380 = _374 * _320;
        float _382 = _376 * _368;
        float _384 = _378 * _368;
        float _386 = _380 * _322;
        out.m_36.x = _382;
        out.m_36.y = _384;
        out.m_36.z = _386;
        out.m_36.w = _318;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _88;
    return out;
}


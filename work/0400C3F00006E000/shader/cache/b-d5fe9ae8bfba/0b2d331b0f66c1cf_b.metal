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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _46(thread const int& _863, thread const int& _864, constant _10& support_buffer)
{
    int _867 = 1 + _864;
    float _869 = support_buffer._m5[_867].x;
    float _871 = abs(_869);
    bool _873 = _871 == 1.0;
    if (_873)
    {
        return _863;
    }
    float _875 = float(_863);
    float _877 = _875 / _871;
    int _879 = int(_877);
    return _879;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_33.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_33.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _414 = float2(_66, _68);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).x;
    float2 _425 = float2(_66, _68);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_425, float2(0.0), isnan(_425))).x;
    float _74 = in.m_35.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_37.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _64 * _78;
    float _88 = _64 * _84;
    float _90 = -_70;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _94 = 1.0 / _92;
    float _96 = fma(_86, _94, _88);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    bool _102 = _94 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _104 = !_102;
    float _106 = _104 ? _98 : 0.0;
    float _108 = precise::max(_72, _106);
    bool _110 = _108 != 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    bool _120 = !_118;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_108, _122, 1.0);
        float _126 = log2(_124);
        float _128 = _126 + (-1.0);
        float _130 = trunc(_128);
        int _132 = int(_130);
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).x;
        int _136 = _134;
        int _138 = 2;
        int _140 = _46(_136, _138, (*spvDescriptorSet0.support_buffer));
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).y;
        int _144 = _142;
        int _146 = 2;
        int _148 = _46(_144, _146, (*spvDescriptorSet0.support_buffer));
        float _150 = float(_140);
        float _152 = float(_148);
        float _154 = fma(_66, _150, -0.5);
        float _156 = fma(_68, _152, -0.5);
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
        float _184 = -_180;
        float _186 = _184 + 1.0;
        float _188 = _172 * _182;
        float _190 = -_180;
        float _192 = _190 + 2.0;
        float _194 = _176 * _176;
        float _196 = _186 * _186;
        float _198 = _188 * 4.0;
        float _200 = _186 * _196;
        float _202 = _192 * _192;
        float _204 = -_198;
        float _206 = fma(_176, _194, _204);
        float _208 = -_188;
        float _210 = _208 + 6.0;
        float _212 = _200 * 4.0;
        float _214 = -_200;
        float _216 = _214 + 6.0;
        float _218 = _166 * _166;
        float _220 = -_206;
        float _222 = _220 + _210;
        float _224 = -_212;
        float _226 = fma(_192, _202, _224);
        float _228 = _180 * _180;
        float _230 = _166 * _218;
        float _232 = _222 * 0.16666667163372039794921875;
        float _234 = -_226;
        float _236 = _234 + _216;
        float _238 = _188 + _206;
        float _240 = _180 * _228;
        float _242 = _162 + (-0.5);
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = _200 + _226;
        float _248 = _238 * 0.16666667163372039794921875;
        float _250 = 1.0 / _232;
        float _252 = _226 * 0.16666667163372039794921875;
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = _160 + (-0.5);
        float _258 = _206 * 0.16666667163372039794921875;
        float _260 = _160 + 1.5;
        float _262 = _162 + 1.5;
        float _264 = _230 * 0.16666667163372039794921875;
        float _266 = 1.0 / _254;
        float _268 = _240 * 0.16666667163372039794921875;
        float _270 = 1.0 / _248;
        float _272 = fma(_264, _250, _260);
        float _274 = 1.0 / _244;
        float _276 = fma(_252, _266, _242);
        float _278 = _272 * _158;
        float _280 = _276 * _168;
        float _282 = fma(_258, _270, _256);
        float _284 = _282 * _158;
        float _286 = fma(_268, _274, _262);
        float _288 = _286 * _168;
        float2 _711 = float2(_284, _280);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_711, float2(0.0), isnan(_711)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_711, float2(0.0), isnan(_711)), level(_128)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _726 = float2(_278, _280);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_726, float2(0.0), isnan(_726)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_726, float2(0.0), isnan(_726)), level(_128)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _741 = float2(_284, _288);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_741, float2(0.0), isnan(_741)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_741, float2(0.0), isnan(_741)), level(_128)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _756 = float2(_278, _288);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_756, float2(0.0), isnan(_756)), level(_128)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_756, float2(0.0), isnan(_756)), level(_128)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float _324 = 0.0 + _126;
        float _326 = precise::clamp(_324, 0.0, 1.0);
        float _328 = -_302;
        float _330 = _294 + _328;
        float _332 = -_304;
        float _334 = _296 + _332;
        float _336 = -_306;
        float _338 = _298 + _336;
        float _340 = fma(_248, _330, _302);
        float _342 = fma(_248, _334, _304);
        float _344 = fma(_248, _338, _306);
        float _346 = -_318;
        float _348 = _310 + _346;
        float _350 = -_320;
        float _352 = _312 + _350;
        float _354 = -_322;
        float _356 = _314 + _354;
        float _358 = fma(_248, _348, _318);
        float _360 = fma(_248, _352, _320);
        float _362 = fma(_248, _356, _322);
        float _364 = -_358;
        float _366 = _364 + _340;
        float _368 = -_360;
        float _370 = _368 + _342;
        float _372 = -_362;
        float _374 = _372 + _344;
        float _376 = fma(_254, _366, _358);
        float _378 = fma(_254, _370, _360);
        float _380 = fma(_254, _374, _362);
        out.m_40.x = _376;
        out.m_40.y = _378;
        out.m_40.z = _380;
        out.m_40.w = _326;
        return out;
    }
    discard_fragment();
    return out;
}


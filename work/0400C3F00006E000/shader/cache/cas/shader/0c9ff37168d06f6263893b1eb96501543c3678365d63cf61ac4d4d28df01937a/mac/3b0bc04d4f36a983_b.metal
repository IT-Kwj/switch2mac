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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _847, thread const int& _848, constant _10& support_buffer)
{
    int _851 = 1 + _848;
    float _853 = support_buffer._m5[_851].x;
    float _855 = abs(_853);
    bool _857 = _855 == 1.0;
    if (_857)
    {
        return _847;
    }
    float _859 = float(_847);
    float _861 = _859 / _855;
    int _863 = int(_861);
    return _863;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_31.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_31.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _404 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = -_68;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _80 = 1.0 / _78;
    float _82 = in.m_35.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    bool _90 = _80 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_90)
    {
        discard_fragment();
    }
    float _92 = _62 * _86;
    float _94 = _62 * _74;
    float _96 = fma(_92, _80, _94);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    if (_90)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    bool _100 = _98 != 0.0;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    bool _110 = !_108;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_98, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _44(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _44(_134, _136, (*spvDescriptorSet0.support_buffer));
        float _140 = float(_130);
        float _142 = float(_138);
        float _144 = fma(_64, _140, -0.5);
        float _146 = fma(_66, _142, -0.5);
        float _148 = 1.0 / _140;
        float _150 = floor(_144);
        float _152 = floor(_146);
        float _154 = -_150;
        float _156 = _144 + _154;
        float _158 = 1.0 / _142;
        float _160 = -_156;
        float _162 = _160 + 1.0;
        float _164 = -_156;
        float _166 = _164 + 2.0;
        float _168 = -_152;
        float _170 = _146 + _168;
        float _172 = _162 * _162;
        float _174 = -_170;
        float _176 = _174 + 1.0;
        float _178 = _162 * _172;
        float _180 = -_170;
        float _182 = _180 + 2.0;
        float _184 = _166 * _166;
        float _186 = _176 * _176;
        float _188 = _178 * 4.0;
        float _190 = _176 * _186;
        float _192 = _182 * _182;
        float _194 = -_188;
        float _196 = fma(_166, _184, _194);
        float _198 = -_178;
        float _200 = _198 + 6.0;
        float _202 = _190 * 4.0;
        float _204 = -_190;
        float _206 = _204 + 6.0;
        float _208 = _156 * _156;
        float _210 = -_196;
        float _212 = _210 + _200;
        float _214 = -_202;
        float _216 = fma(_182, _192, _214);
        float _218 = _170 * _170;
        float _220 = _156 * _208;
        float _222 = _212 * 0.16666667163372039794921875;
        float _224 = -_216;
        float _226 = _224 + _206;
        float _228 = _178 + _196;
        float _230 = _170 * _218;
        float _232 = _152 + (-0.5);
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = _190 + _216;
        float _238 = _228 * 0.16666667163372039794921875;
        float _240 = 1.0 / _222;
        float _242 = _216 * 0.16666667163372039794921875;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = _150 + (-0.5);
        float _248 = _196 * 0.16666667163372039794921875;
        float _250 = _150 + 1.5;
        float _252 = _152 + 1.5;
        float _254 = _220 * 0.16666667163372039794921875;
        float _256 = 1.0 / _244;
        float _258 = _230 * 0.16666667163372039794921875;
        float _260 = 1.0 / _238;
        float _262 = fma(_254, _240, _250);
        float _264 = 1.0 / _234;
        float _266 = fma(_242, _256, _232);
        float _268 = _262 * _148;
        float _270 = _266 * _158;
        float _272 = fma(_248, _260, _246);
        float _274 = _272 * _148;
        float _276 = fma(_258, _264, _252);
        float _278 = _276 * _158;
        float2 _696 = float2(_274, _270);
        float3 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_696, float2(0.0), isnan(_696)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_696, float2(0.0), isnan(_696)), level(_118)).xyz;
        float _284 = _282.x;
        float _286 = _282.y;
        float _288 = _282.z;
        float2 _711 = float2(_268, _270);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_711, float2(0.0), isnan(_711)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_711, float2(0.0), isnan(_711)), level(_118)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _726 = float2(_274, _278);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_726, float2(0.0), isnan(_726)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_726, float2(0.0), isnan(_726)), level(_118)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _741 = float2(_268, _278);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_741, float2(0.0), isnan(_741)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_741, float2(0.0), isnan(_741)), level(_118)).xyz;
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
        float _330 = fma(_238, _320, _292);
        float _332 = fma(_238, _324, _294);
        float _334 = fma(_238, _328, _296);
        float _336 = -_308;
        float _338 = _300 + _336;
        float _340 = -_310;
        float _342 = _302 + _340;
        float _344 = -_312;
        float _346 = _304 + _344;
        float _348 = fma(_238, _338, _308);
        float _350 = fma(_238, _342, _310);
        float _352 = fma(_238, _346, _312);
        float _354 = -_348;
        float _356 = _354 + _330;
        float _358 = -_350;
        float _360 = _358 + _332;
        float _362 = -_352;
        float _364 = _362 + _334;
        float _366 = fma(_244, _356, _348);
        float _368 = fma(_244, _360, _350);
        float _370 = fma(_244, _364, _352);
        out.m_38.x = _366;
        out.m_38.y = _368;
        out.m_38.z = _370;
        out.m_38.w = _316;
        return out;
    }
    discard_fragment();
    return out;
}


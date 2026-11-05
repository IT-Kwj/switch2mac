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
int _42(thread const int& _956, thread const int& _957, constant _10& support_buffer)
{
    int _960 = 1 + _957;
    float _962 = support_buffer._m5[_960].x;
    float _964 = abs(_962);
    bool _966 = _964 == 1.0;
    if (_966)
    {
        return _956;
    }
    float _968 = float(_956);
    float _970 = _968 / _964;
    int _972 = int(_970);
    return _972;
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
    float2 _444 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_444, float2(0.0), isnan(_444))).x;
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
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::max(_100, _90);
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    bool _116 = !_114;
    if (!_116)
    {
        float _118 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _120 = fma(_102, _118, 1.0);
        float _122 = log2(_120);
        float _124 = _122 + (-1.0);
        float _126 = trunc(_124);
        int _128 = int(_126);
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _132 = _130;
        int _134 = 1;
        int _136 = _42(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _140 = _138;
        int _142 = 1;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        float _146 = float(_136);
        float _148 = float(_144);
        float _150 = fma(_62, _146, -0.5);
        float _152 = fma(_64, _148, -0.5);
        float _154 = 1.0 / _146;
        float _156 = floor(_150);
        float _158 = floor(_152);
        float _160 = -_156;
        float _162 = _150 + _160;
        float _164 = -_162;
        float _166 = _164 + 1.0;
        float _168 = -_162;
        float _170 = _168 + 2.0;
        float _172 = -_158;
        float _174 = _152 + _172;
        float _176 = _166 * _166;
        float _178 = -_174;
        float _180 = _178 + 1.0;
        float _182 = _166 * _176;
        float _184 = -_174;
        float _186 = _184 + 2.0;
        float _188 = _170 * _170;
        float _190 = _180 * _180;
        float _192 = _182 * 4.0;
        float _194 = -_182;
        float _196 = _194 + 6.0;
        float _198 = _180 * _190;
        float _200 = _186 * _186;
        float _202 = -_192;
        float _204 = fma(_170, _188, _202);
        float _206 = _198 * 4.0;
        float _208 = 1.0 / _148;
        float _210 = -_204;
        float _212 = _210 + _196;
        float _214 = -_206;
        float _216 = fma(_186, _200, _214);
        float _218 = -_198;
        float _220 = _218 + 6.0;
        float _222 = _212 * 0.16666667163372039794921875;
        float _224 = _182 + _204;
        float _226 = _162 * _162;
        float _228 = -_216;
        float _230 = _228 + _220;
        float _232 = _174 * _174;
        float _234 = _224 * 0.16666667163372039794921875;
        float _236 = 1.0 / _222;
        float _238 = _230 * 0.16666667163372039794921875;
        float _240 = _198 + _216;
        float _242 = _162 * _226;
        float _244 = _174 * _232;
        float _246 = _158 + (-0.5);
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = _216 * 0.16666667163372039794921875;
        float _252 = 1.0 / _238;
        float _254 = _156 + (-0.5);
        float _256 = _156 + 1.5;
        float _258 = _158 + 1.5;
        float _260 = _242 * 0.16666667163372039794921875;
        float _262 = _244 * 0.16666667163372039794921875;
        float _264 = _204 * 0.16666667163372039794921875;
        float _266 = 1.0 / _248;
        float _268 = fma(_260, _236, _256);
        float _270 = _268 * _154;
        float _272 = 1.0 / _234;
        float _274 = fma(_262, _252, _258);
        float _276 = _274 * _208;
        float _278 = fma(_250, _266, _246);
        float _280 = _278 * _208;
        float _282 = fma(_264, _272, _254);
        float _284 = _282 * _154;
        float2 _738 = float2(_284, _280);
        float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_738, float2(0.0), isnan(_738)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_738, float2(0.0), isnan(_738)), level(_124)).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        float2 _753 = float2(_270, _280);
        float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_753, float2(0.0), isnan(_753)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_753, float2(0.0), isnan(_753)), level(_124)).xyz;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float2 _768 = float2(_284, _276);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_768, float2(0.0), isnan(_768)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_768, float2(0.0), isnan(_768)), level(_124)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _783 = float2(_270, _276);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_783, float2(0.0), isnan(_783)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_783, float2(0.0), isnan(_783)), level(_124)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float _320 = -_298;
        float _322 = _290 + _320;
        float _324 = -_300;
        float _326 = _292 + _324;
        float _328 = -_314;
        float _330 = _306 + _328;
        float _332 = -_302;
        float _334 = _294 + _332;
        float _336 = -_316;
        float _338 = _308 + _336;
        float _340 = -_318;
        float _342 = _310 + _340;
        float _344 = 0.0 + _122;
        float _346 = precise::clamp(_344, 0.0, 1.0);
        float _348 = fma(_234, _322, _298);
        float _350 = fma(_234, _326, _300);
        float _352 = fma(_234, _334, _302);
        float _354 = fma(_234, _330, _314);
        float _356 = fma(_234, _338, _316);
        float _358 = fma(_234, _342, _318);
        float _360 = fma(_88, _346, _86);
        float _362 = -_354;
        float _364 = _362 + _348;
        float _366 = -_356;
        float _368 = _366 + _350;
        float _370 = -_358;
        float _372 = _370 + _352;
        float _374 = 1.0 / _360;
        float _376 = fma(_248, _364, _354);
        float _378 = fma(_248, _368, _356);
        float _380 = fma(_248, _372, _358);
        float _382 = _346 * _376;
        float _384 = _346 * _378;
        float _386 = _346 * _380;
        float _388 = -_382;
        float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _392 = -_384;
        float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _396 = -_386;
        float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _400 = fma(_86, _390, _382);
        float _402 = fma(_86, _394, _384);
        float _404 = fma(_86, _398, _386);
        float _406 = _400 * _374;
        float _408 = _402 * _374;
        float _410 = _404 * _374;
        out.m_36.x = _406;
        out.m_36.y = _408;
        out.m_36.z = _410;
        out.m_36.w = _360;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _86;
    return out;
}


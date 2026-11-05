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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    texturecube<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    float _38 = 0.0;
    float _40 = 0.0;
    float _42 = 0.0;
    float _44 = 0.0;
    float _46 = 0.0;
    float _48 = 0.0;
    float _50 = 0.0;
    float _52 = 0.0;
    float _54 = 0.0;
    float _56 = 0.0;
    float _58 = 0.0;
    float _60 = 0.0;
    float _62 = 0.0;
    bool _66;
    bool _132;
    float _234;
    float _236;
    float _238;
    float _240;
    float _242;
    float _244;
    float _246;
    float _248;
    float _250;
    float _252;
    float _254;
    float _256;
    do
    {
        float _68 = _38;
        float _70 = _40;
        float _72 = _42;
        float _74 = _44;
        float _76 = _46;
        float _78 = _48;
        float _80 = _50;
        float _82 = _52;
        float _84 = _54;
        float _86 = _56;
        float _88 = _58;
        float _90 = _60;
        float _92 = _62;
        float _94 = _68 * 0.15915493667125701904296875;
        float _96 = _94 * 6.283185482025146484375;
        float _98 = cos(_96);
        float _100 = _94 * 6.283185482025146484375;
        float _102 = sin(_100);
        float _104 = _98 * _98;
        float _106 = -3.1415927410125732421875;
        float _108 = _70;
        float _110 = _72;
        float _112 = _74;
        float _114 = _76;
        float _116 = _78;
        float _118 = _80;
        float _120 = _82;
        float _122 = _84;
        float _124 = _86;
        float _126 = _88;
        float _128 = _90;
        float _130 = _92;
        do
        {
            float _134 = _106;
            float _136 = _108;
            float _138 = _110;
            float _140 = _112;
            float _142 = _114;
            float _144 = _116;
            float _146 = _118;
            float _148 = _120;
            float _150 = _122;
            float _152 = _124;
            float _154 = _126;
            float _156 = _128;
            float _158 = _130;
            float _160 = _134 * 0.15915493667125701904296875;
            float _162 = _160 * 6.283185482025146484375;
            float _164 = cos(_162);
            float _166 = _160 * 6.283185482025146484375;
            float _168 = sin(_166);
            float _170 = _102 * _164;
            float _172 = fma(_170, _170, _104);
            float _174 = _102 * _168;
            float _176 = fma(_174, _174, _172);
            float _178 = rsqrt(_176);
            float _180 = _170 * _178;
            float _182 = _98 * _178;
            float _184 = _174 * _178;
            float _186 = abs(_180);
            float _188 = abs(_182);
            float _190 = precise::max(_186, _188);
            float _192 = abs(_184);
            float _194 = precise::max(_192, _190);
            float _196 = 1.0 / _194;
            float _198 = _180 * _196;
            float _200 = _182 * _196;
            float _202 = -_196;
            float _204 = _184 * _202;
            float3 _418 = float3(_198, _200, _204);
            float3 _208 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_418, float3(0.0), isnan(_418)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_418, float3(0.0), isnan(_418)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)).xyz;
            float _210 = _208.x;
            float _212 = _208.y;
            float _214 = _208.z;
            float _216 = _134 + (*spvDescriptorSet0.cp_c3)._m0[0].y;
            float _218 = _182 * 0.48860299587249755859375;
            float _220 = _184 * 0.48860299587249755859375;
            float _222 = _180 * 0.48860299587249755859375;
            bool _224 = _216 >= 3.1415927410125732421875;
            bool _226 = isnan(_216);
            bool _228 = _224 || _226;
            bool _230 = isnan(3.1415927410125732421875);
            bool _232 = _228 || _230;
            _234 = fma(_210, 0.2820949852466583251953125, _136);
            _236 = fma(_210, _218, _138);
            _238 = fma(_210, _220, _140);
            _240 = fma(_210, _222, _142);
            _242 = fma(_212, 0.2820949852466583251953125, _144);
            _244 = fma(_212, _218, _146);
            _246 = fma(_212, _220, _148);
            _248 = fma(_212, _222, _150);
            _250 = fma(_214, _218, _152);
            _252 = fma(_214, _220, _154);
            _254 = fma(_214, _222, _156);
            _256 = fma(_214, 0.2820949852466583251953125, _158);
            _132 = !_232;
            _40 = _234;
            _42 = _236;
            _44 = _238;
            _46 = _240;
            _48 = _242;
            _50 = _244;
            _52 = _246;
            _54 = _248;
            _56 = _250;
            _58 = _252;
            _60 = _254;
            _62 = _256;
            _106 = _216;
            _108 = _234;
            _110 = _236;
            _112 = _238;
            _114 = _240;
            _116 = _242;
            _118 = _244;
            _120 = _246;
            _122 = _248;
            _124 = _250;
            _126 = _252;
            _128 = _254;
            _130 = _256;
        } while (_132);
        float _258 = _68 + (*spvDescriptorSet0.cp_c3)._m0[0].x;
        bool _260 = _258 > 3.1415927410125732421875;
        bool _262 = isnan(_258);
        bool _264 = _260 || _262;
        bool _266 = isnan(3.1415927410125732421875);
        bool _268 = _264 || _266;
        _66 = !_268;
        _38 = _258;
    } while (_66);
    float _270 = _238 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _272 = _240 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _274 = _248 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _276 = _234 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _278 = _236 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _280 = _242 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _282 = _244 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _284 = _246 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _286 = _256 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _288 = _250 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _290 = _252 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _292 = _254 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    (*spvDescriptorSet0.cp_s0)._m0[0] = as_type<uint>(_276);
    (*spvDescriptorSet0.cp_s0)._m0[1] = as_type<uint>(_278);
    (*spvDescriptorSet0.cp_s0)._m0[2] = as_type<uint>(_270);
    (*spvDescriptorSet0.cp_s0)._m0[3] = as_type<uint>(_272);
    (*spvDescriptorSet0.cp_s0)._m0[4] = as_type<uint>(_280);
    (*spvDescriptorSet0.cp_s0)._m0[5] = as_type<uint>(_282);
    (*spvDescriptorSet0.cp_s0)._m0[6] = as_type<uint>(_284);
    (*spvDescriptorSet0.cp_s0)._m0[7] = as_type<uint>(_274);
    (*spvDescriptorSet0.cp_s0)._m0[8] = as_type<uint>(_286);
    (*spvDescriptorSet0.cp_s0)._m0[9] = as_type<uint>(_288);
    (*spvDescriptorSet0.cp_s0)._m0[10] = as_type<uint>(_290);
    (*spvDescriptorSet0.cp_s0)._m0[11] = as_type<uint>(_292);
}

